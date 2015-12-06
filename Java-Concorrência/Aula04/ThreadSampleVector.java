import java.util.Random;

public class ThreadSampleVector extends Thread {
	
	public void run () {

		Random random = new Random();
		int operation;

		for (int i = 0; i < 20; i++){
			operation = random.nextInt(3);
			int index = random.nextInt(SafeVectorMain.safeVector.vector.length);

			if (operation == 0){ //write
				int info = random.nextInt(101);
				SafeVectorMain.safeVector.safeWrite(index, info);
			}
			else if (operation == 1){ // read
				int info = random.nextInt(101);
				SafeVectorMain.safeVector.safeRead(index);
			}
			else {
				int index2 = random.nextInt(SafeVectorMain.safeVector.vector.length);
				SafeVectorMain.safeVector.safeSwap(index, index2);
			}
		}


	}
}