import java.lang.Thread;

public class SimpleThread extends Thread {

	public void run() {

		while (Main.count <= Main.x){
			System.out.println("Count = " + Main.count++);
			System.out.println();

			try{
				if (interrupted()){
					return;
				}
				sleep(1);
			}
			catch (InterruptedException e){
				e.printStackTrace();
			}
		}

		if (Main.count > Main.x){
			interrupt();
		}
	}

}