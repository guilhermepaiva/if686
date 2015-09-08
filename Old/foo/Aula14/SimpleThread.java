import java.lang.Thread;


public class SimpleThread extends Thread {

	Conta conta1 = null;
	Conta conta2 = null;

	public SimpleThread (Conta conta1, Conta conta2){
		this.conta1 = conta1;
		this.conta2 = conta2;
	}

	public void run () {
		conta1.transferir(conta2, 25);
	}
}