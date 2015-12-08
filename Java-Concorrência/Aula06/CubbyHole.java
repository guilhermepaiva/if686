import java.util.concurrent.locks.*;

public class CubbyHole {

	private int quantidade;
	private boolean disponibilidade;
	private Lock aLock = new ReentrantLock();
	private Condition variavelCondicional = aLock.newCondition();

	public int get (int who) {
		aLock.lock();

		try {
			while (disponibilidade == false) {
				try {
					variavelCondicional.await();
				} catch (InterruptedException e) {}
			}

			disponibilidade = false;
			System.out.println("Consumidor " + who + "pegou: " + quantidade);
			variavelCondicional.signalAll();
		} finally {
			aLock.unlock();
			return quantidade;
		}
	}

	public void put (int who, int value) {
		aLock.lock();

		try {
			while (disponibilidade == true) {
				try {
					variavelCondicional.await();
				} catch (InterruptedException e) {}
			}

			quantidade = value;
			disponibilidade = true;
			System.out.println("Produtor " + who + " colocou " + quantidade);
			variavelCondicional.signalAll();
		} finally {
			aLock.unlock();
		}
	}

}