import java.util.ArrayList;

public class Main {

	public static Queue queue = new Queue();

	public static void main(String[] args) {

		ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread> ();

		for (int i = 0; i < 10; i++){
			SimpleThread simpleThread = new SimpleThread();
			arraySimpleThread.add(simpleThread);
			simpleThread.start();
		}

		try {
			for (SimpleThread t : arraySimpleThread){
				t.join();
			}
			System.out.println(queue.print());
		}
		catch (InterruptedException e){
			e.printStackTrace();
		}
		
	}
}