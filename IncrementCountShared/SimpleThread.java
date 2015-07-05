import java.lang.Thread;

public class SimpleThread extends Thread {

	public void run() {

		while (Main.count <= Main.x){
			System.out.println("Thread: " + Main.i);
			System.out.println("Count = " + Main.count);
			System.out.println();
			Main.count++;
		}
	}

}