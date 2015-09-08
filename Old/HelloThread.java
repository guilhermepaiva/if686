public class HelloThread extends Thread {

	public void run(){
		System.out.println("Hi from a thread");
	}
	
	public static void main(String[] args) {
		(new HelloThread()).start();
	}
}