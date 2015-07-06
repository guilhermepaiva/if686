import java.lang.Thread;
import java.util.Random;

public class SimpleThread extends Thread {

	public void run() {

		Random random = new Random();
		int x = random.nextInt();
		Main.queue.insert(x);

	}
}