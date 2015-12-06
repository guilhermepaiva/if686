public class GerContas extends Thread {

	Conta[] contas = null;

	public GerContas (Conta[] accs) {
		contas = accs;
	}

	public void run (){
		contas[0].depositar(100); //conta 1
		contas[3].sacar(50); //conta 4
		contas[2].depositar(100); //conta 3
		contas[1].sacar(50); //conta 2
	}
}