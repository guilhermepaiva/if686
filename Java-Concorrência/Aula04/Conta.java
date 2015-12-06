import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Lock;

public class Conta {

	double saldo;
	String nome;
	private Lock lock = new ReentrantLock();

	public Conta (String nm, double s) {
		this.nome = nm;
		this.saldo = s;
	}

	public void depositar (double money) {
		saldo += money;
	}

	public void sacar (double money) {
		saldo -= money;
	}

	// deve ser feita atomicamente
	public void transferir (Conta destino, Conta origem, double money) {
		boolean t1 = lock.tryLock();
		boolean t2 = destino.lock.tryLock();

		try {
			while (!(t1 && t2)){
				if (t1) lock.unlock();
				if (t2) destino.lock.unlock();
				t1 = lock.tryLock(); t2 = destino.lock.tryLock();
			}
			this.saldo -= money;
			destino.saldo += money;
		} finally {
			if (t1) lock.unlock();
			if (t2) destino.lock.unlock();
		}
	}

	public String toString () {
		return nome + " Saldo = " + saldo;
	}
}