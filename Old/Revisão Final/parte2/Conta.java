public class Conta {

	double saldo;
	String nome;

	public Conta (String nm, double amnt) {
		saldo = amnt;
		nome = nm;
	}

	void depositar (double money){
		saldo += money;
	}

	void sacar (double money){
		saldo -= money;
	}

	void transferir(Conta ac, double mn){
		saldo -= mn;
		ac.saldo += mn;
	}	

	public static void main(String[] args) {
	Conta c1 = new Conta ("Vinicius", 100.00);
	Conta c2 = new Conta ("Stephen Black", 100.00);
	Conta c3 = new Conta ("Arabella", 100.00);
	Conta c4 = new Conta ("John Childermass", 100.00);

	GerContas g1 = new GerContas (new Conta[]{c1, c2, c3, c4});
	GerContas g2 = new GerContas (new Conta[]{c1, c2, c3, c4});

	g1.start();
	g2.start();

	try {
		g1.join();
		g2.join();
	}
	catch (InterruptedException e){

	}

	for (int i = 0; i <= 3; i++){
		System.out.println(g1.contas[i].saldo);
	}

	for (int i = 0; i <= 3; i++){
		System.out.println(g2.contas[i].saldo);
	}


}
}



class GerContas extends Thread {
	Conta[] contas = null;

	public GerContas (Conta[] accs){
		contas = accs;
	}

	public void run() {
		contas[0].depositar(100);
		contas[1].transferir(contas[2], 75);
		contas[3].sacar(50);
		contas[0].transferir(contas[3], 100);
	}
}