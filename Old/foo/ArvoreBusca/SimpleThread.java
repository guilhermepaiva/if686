import java.lang.Thread;
import java.util.Random;

public class SimpleThread extends Thread {

	public void run() {

		Random random = new Random();
		int count = 0;
		int valueToBeInserted;

		while (count < 10){
			valueToBeInserted = random.nextInt(10);
			Main.tree.insert(valueToBeInserted);
			count++;
		}
	}
}
