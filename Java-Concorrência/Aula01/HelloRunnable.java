public class HelloRunnable implements Runnable {

	public void run () {
		System.out.println("Hi from a Runnable thread");
	}

	public static void main(String[] args) {
		
		(new Thread(new HelloRunnable())).start();
	}
	
}