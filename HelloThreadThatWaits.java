public class HelloThreadThatWaits extends Thread {

	public void run() {
		System.out.println("Hi from a thread");
	}

	public static void main(String[] args) {
		Thread t = new HelloThreadThatWaits();
		t.start();

		try {
			t.join(); // main thread waits for t to finish
		}
		catch (InterruptedException ie) {

		}
	}

}