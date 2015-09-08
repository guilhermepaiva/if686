import java.lang.Thread;

public class GerContas extends Thread {

	Conta[] contas = null;

	public GerContas (Conta[] accs){
		contas = accs;
	}


	public void run () {
		contas[0].depositar(100);
		contas[3].sacar(50);
		contas[2].depositar(100);
		contas[1].sacar(50);
	}

}