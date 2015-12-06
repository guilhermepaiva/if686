import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Lock;


public class Vector {

	public Node[] vector;

	public Vector () {}

	public Vector (int vectorLength) {
		this.vector = new Node[vectorLength];
		for (int i = 0; i < vectorLength; i++) {
			vector[i] = new Node(0, i); // inicializa o vector com zeros 
		}
	}

	public int safeRead (int index) {
		synchronized (vector[index]) {
			return vector[index].value;
		}
	}

	public void safeWrite (int index, int v) {
		synchronized (vector[index]){
			vector[index] = new Node(v, index);
		}
	}

	public void safeSwap (int index1, int index2) {

		boolean boolIndex1 = vector[index1].lock.tryLock();
		boolean boolIndex2 = vector[index2].lock.tryLock();

		while (!(boolIndex1 && boolIndex2)){
			if (boolIndex1) vector[index1].lock.unlock();
			if (boolIndex2) vector[index2].lock.unlock();

			vector[index1].lock.tryLock(); vector[index2].lock.tryLock();
		}

		try {
			int temp = vector[index1].value;
			vector[index1].value = vector[index2].value;
			vector[index2].value = temp;

		} finally {
			if (boolIndex1) vector[index1].lock.unlock(); 
			if (boolIndex2) vector[index2].lock.unlock();
		}

	}

	public String printVector () {
		StringBuffer stringBuffer = new StringBuffer();

		for (int i = 0; i < this.vector.length; i++){
			stringBuffer.append(this.vector[i].value);

			if (i != this.vector.length - 1) {
				stringBuffer.append(" ");
			}
		}

		return stringBuffer.toString();
	}
	
}