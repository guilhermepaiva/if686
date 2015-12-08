import java.util.ArrayList;

public class Rooms {

	public static MainThread room;

	private int m; //colecao de quartos indexada de 0 a m
	public static boolean noMoreThreads = false;
	public static ArrayList<SimpleThread> arraySimpleThread;
	
	public Rooms (int m){
		this.m = m;
	}

	public static void main(String[] args) {
		arraySimpleThread = new ArrayList<SimpleThread>();

		room = new MainThread();
		room.start();

		for (int i = 0; i < 50; i++){
			SimpleThread simpleThread = new SimpleThread(i);
			arraySimpleThread.add(simpleThread);
			simpleThread.start();
		}

		try {
			for (SimpleThread st : arraySimpleThread){
				st.join();
			}
		} catch (InterruptedException e) {}

		noMoreThreads = true;

		System.out.println("Quarto Vazio!");
	}
}

class MainThread extends Thread {

	public int simpleThreadI, simpleThreadO; //quantidade de threads dentro e fora
	public volatile boolean estaNoQuarto;

	public MainThread () {
		this.simpleThreadI = 0;
		this.simpleThreadO = 0;
		this.estaNoQuarto = false;
	}

	public void run () {

		while (simpleThreadO != 0 || !Rooms.noMoreThreads){
			if (simpleThreadI != 0){
				estaNoQuarto  = true;
			} else {
				if (simpleThreadO > 2*simpleThreadI) estaNoQuarto = true; //evitar starvation
				else estaNoQuarto = false; // evitar starvation
			}

			synchronized (this){
				notifyAll();
			}

		}

	}

	public synchronized void entrarQuarto (int id) throws InterruptedException {
		while (!estaNoQuarto) {
			wait();
		}
		simpleThreadO--;
		simpleThreadI++;
		System.out.println("Thread com id = " + id + " entrou no quarto!");
	}

	public synchronized void sairQuarto (int id) {
		simpleThreadI--;
		System.out.println("Thread com id = " + id + " saiu do quarto!");
	}

}

class SimpleThread extends Thread {
	public int id;

	public SimpleThread (int id) {
		this.id = id;

		synchronized (Rooms.room){
			Rooms.room.simpleThreadO++;
		}
	}

	public void run () {
		try {
			Rooms.room.entrarQuarto(id);
		} catch (InterruptedException e) {}

		Rooms.room.sairQuarto(id);
	}


}