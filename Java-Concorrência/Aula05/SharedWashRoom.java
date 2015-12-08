import java.util.ArrayList;

public class SharedWashRoom {

	public static MainThread washroom;

	public static ArrayList<ManThread> mtl;
	public static ArrayList<WomanThread> wtl;

	public static boolean noMoreThreads = false;

	public static void main (String[] args) {
		mtl = new ArrayList<ManThread>();
		wtl = new ArrayList<WomanThread>();
		
		washroom = new MainThread();
		washroom.start();

		for (int i = 0; i < 50; i++){
			ManThread mt = new ManThread(i);
			mtl.add(mt);
			mt.start();

			WomanThread wt = new WomanThread(i);
			wtl.add(wt);
			wt.start();
		}


		try {

			for (ManThread mt : mtl) {
				mt.join();
			}

			for (WomanThread wt : wtl){
				wt.join();
			}

		} catch (InterruptedException e) { 
			e.printStackTrace(); 
		}

		noMoreThreads = true;

		System.out.println("Banheiro Vazio!!!");
	}


}

class MainThread extends Thread {
	public int manI, womanI, manO, womanO; // quantos homes e mulheres estao dentro I = inside e O = outside
	public volatile boolean genre; // false se mulher e true se homem

	public MainThread () {
		this.manI = 0;
		this.womanI = 0;
		this.manO = 0;
		this.womanO = 0;
		this.genre = true;
	}

	public void run () {

		while (manO != 0 || womanO != 0 || !SharedWashRoom.noMoreThreads){
			if (manO == 0){
				genre = false;
			} else if (womanO == 0){
				genre = true;
			} else {
				if (manO > 2*womanO) genre = true;
				else if (womanO > 2*manO) genre = false;
			}

			synchronized (this){
				notifyAll();
			}
		}
	}


	public synchronized void entrarHomem (int id) throws InterruptedException {
		while (!genre || womanI != 0){
			wait();
		}

		manO--;
		manI++;
		System.out.println("Homem " + id + " entrou no banheiro!");
	}

	public synchronized void sairHomem (int id) {
		manI--;
		System.out.println("Homem " + id + " saiu do banheiro!");
	}

	public synchronized void entrarMulher (int id) throws InterruptedException {
		while (genre || manI != 0) {
			wait();
		}

		womanO--;
		womanI++;
		System.out.println("Mulher " + id + " entrou no banheiro!");
	}

	public synchronized void sairMulher (int id) {
		womanI--;
		System.out.println("Mulher " + id + " saiu do banheiro!");
	}
}


class ManThread extends Thread {
	public int id;

	public ManThread (int id) {
		this.id = id;

		synchronized (SharedWashRoom.washroom){
			SharedWashRoom.washroom.manO++;
		}
	}

	public void run () {
		try {
			SharedWashRoom.washroom.entrarHomem(id);
		} catch (InterruptedException e) {}

		SharedWashRoom.washroom.sairHomem(id);
	}
}

class WomanThread extends Thread {
	public int id;

	public WomanThread (int id) {
		this.id = id;

		synchronized (SharedWashRoom.washroom){
			SharedWashRoom.washroom.womanO++;
		}
	}

	public void run () {
		try {
			SharedWashRoom.washroom.entrarMulher(id);
		} catch (InterruptedException e) {}

		SharedWashRoom.washroom.sairMulher(id);
	}

	
}

