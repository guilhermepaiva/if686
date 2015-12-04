import java.util.Random;

public class ThreadSafeQueue extends Thread {
	public void run () {
		Random random = new Random();
		int toBeInserted = random.nextInt();
		SafeQueueMain.queue.insert(toBeInserted);
	}
}