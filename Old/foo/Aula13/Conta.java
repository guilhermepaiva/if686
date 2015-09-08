public class Conta {
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
}