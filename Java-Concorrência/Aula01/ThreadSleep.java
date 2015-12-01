public class ThreadSleep extends Thread {

	public void run () {
		
		while (ThreadSleepTest.sharedCount <= ThreadSleepTest.limit) {
			System.out.println("sharedCount: " + ThreadSleepTest.sharedCount++);	

			try{
				if (interrupted()){
					return;
				}
				sleep(1000);
			}
			catch (InterruptedException e) {}

			if (ThreadSleepTest.sharedCount >= ThreadSleepTest.limit) {
				interrupt();
			}
		}

	}
}