import java.lang.Thread;
import java.util.Random;

public class SimpleThread extends Thread {

	public void run() {

		Random random = new Random();
		int theCase;


		for (int i = 0; i < 4; i++){
			theCase = random.nextInt(3);
			int index = random.nextInt(Main.myVector.vector.length);

			if (theCase == 0){ //escreve
				int newValue = random.nextInt(100);
				Main.myVector.safeWrite(index, newValue);
			}
			else if (theCase == 1){ //le
				System.out.println(Main.myVector.safeRead(index));
			}
			else { //swap
				int index2 = random.nextInt(Main.myVector.vector.length);
				Main.myVector.safeSwap(index, index2);
			}
		}


	}
}