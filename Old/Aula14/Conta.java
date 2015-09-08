import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;


public class Conta {

	private Lock lock = new ReentrantLock();

	double saldo;
	String nome;

	public Conta(String nm, double amnt){
		this.saldo = amnt;
		this.nome = nm;
	}

	public synchronized void depositar (double money){
		saldo += money;
	}

	public synchronized void sacar (double money){
		saldo -= money;
	}


	public String toString(){
		return nome + " Saldo = " + saldo;
	}

	//deve ser feita atomicamente
	public void transferir (Conta dest, double money){

		boolean t1 = lock.tryLock();
		boolean t2 = dest.lock.tryLock();

		try {
			while (!(t1 && t2)){
				if (t1) lock.unlock();
				if (t2) dest.lock.unlock();
				t1 = lock.tryLock();
				t2 = dest.lock.tryLock();
			}
			this.saldo -= money;
			dest.saldo += money;
		}
		finally {
			if (t1) lock.unlock();
			if (t2) dest.lock.unlock();
		}

	}
}