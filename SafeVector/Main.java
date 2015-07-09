import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Lock;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

	public static Vector myVector;

	public static void main(String[] args) {

		System.out.println("Digite o tamanho do vector");
		Scanner scanner = new Scanner(System.in);
		int tamanho = scanner.nextInt();
		scanner.close();

		myVector = new Vector(tamanho);

		ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread> ();

		for (int i = 0; i < 10; i++){
			SimpleThread simpleTread = new SimpleThread();
			arraySimpleThread.add(simpleTread);
			simpleTread.start();
		}

		try {
			for (SimpleThread t : arraySimpleThread){
				t.join();
			}
		}
		catch (InterruptedException e){
			e.printStackTrace();
		}

		
	
	}

}

class Node {

	int value;
	int position;
	Lock lock;

	public Node (int value, int position){
		this.value = value;
		this.position = position;
		this.lock = new ReentrantLock();
	}

}


class Vector {

	Node[] vector;

	public Vector (int len){
		this.vector = new Node[len];

		for (int i = 0; i < len; i++){
			this.vector[i] = new Node(0, i);
		}
	}

	public void safeWrite(int position, int newValue){
		synchronized (vector[position]){
			vector[position].value = newValue;
		}
	}

	public int safeRead(int position){
		synchronized (vector[position]){
			return vector[position].value;
		}
	}

	public void safeSwap(int position1, int position2){
		boolean lock1 = vector[position1].lock.tryLock();
		boolean lock2 = vector[position2].lock.tryLock();

		while (!(lock1 && lock2)){
			if (lock1) vector[position1].lock.unlock();
			if (lock2) vector[position2].lock.unlock();

			vector[position1].lock.tryLock();
			vector[position2].lock.tryLock();

		}

		try {
			int temp = 0;

			if (position1 != position2){
				temp = vector[position1].value;
				vector[position1].value = vector[position2].value;
				vector[position2].value = temp;
			} 
		} finally {
			if (lock1) vector[position1].lock.unlock();
			if (lock2) vector[position2].lock.unlock();
		}
	}

	public String printVector(){

		StringBuffer stringBuffer = new StringBuffer();

		for (int i = 0; i < this.vector.length; i++){
			stringBuffer.append(this.vector[i].value);
			stringBuffer.append(" ");
		}

		return stringBuffer.toString();

	}
}
