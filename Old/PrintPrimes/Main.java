import java.util.ArrayList;


public class Main {

	static Count count =  new Count(1);

	public static void main(String[] args) {

		SimpleThread simpleThread1 = new SimpleThread();
		simpleThread1.start();

		SimpleThread simpleThread2 = new SimpleThread();
		simpleThread2.start();

		SimpleThread simpleThread3 = new SimpleThread();
		simpleThread3.start();

		SimpleThread simpleThread4 = new SimpleThread();
		simpleThread4.start();
		
		
	}
}