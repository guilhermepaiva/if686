import java.util.ArrayList;

public class ThreadSleepTest {

	public static int sharedCount = 0;
	public static int limit = 100;

	public static void main(String[] args) {

		int amountOfThreads = 5;
		ArrayList<ThreadSleep> arrayListThread = new ArrayList<ThreadSleep>();

		for (int i = 0; i < amountOfThreads; i++){
			ThreadSleep threadSleep = new ThreadSleep();
			threadSleep.start();
			arrayListThread.add(threadSleep);
		}

		for (ThreadSleep t : arrayListThread){
			try{
				t.join();
			}
			catch (InterruptedException e) {}
		}
	}
}