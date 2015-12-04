import java.util.ArrayList;

public class SafeQueueMain extends Thread {

	public static SafeQueue queue = new SafeQueue();

	public static void main(String[] args) {

		ArrayList<ThreadSafeQueue> arrayThreadSafeQueue = new ArrayList<ThreadSafeQueue>();


		for (int i = 0; i < 10; i++) {
			ThreadSafeQueue threadSafeQueue = new ThreadSafeQueue();
			threadSafeQueue.start();
			arrayThreadSafeQueue.add(threadSafeQueue);
		}

		for (ThreadSafeQueue t : arrayThreadSafeQueue){
			try {
				t.join();
			}
			catch (InterruptedException e) {}
		}

		System.out.println(queue.printQueue());
		
	}
}