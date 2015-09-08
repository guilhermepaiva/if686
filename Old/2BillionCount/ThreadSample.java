public class ThreadSample extends Thread {
	public void run() {
		try {
			while (ThreadSampleTest.count <= 1000){
				System.out.println(ThreadSampleTest.count++);
				sleep(1);
			}
		}
		catch (InterruptedException e){

		}
	}
}