import java.util.ArrayList;


public class Main {

	//ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread> ();

	public static void main(String[] args) {

		for (int i = 0; i < 5; i++){
			SimpleThread simpleThread = new SimpleThread();
			simpleThread.start();
		}
		
	}
}