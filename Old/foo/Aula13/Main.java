import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		
		
		Conta[] contas = new Conta[4];
		contas[0] = new Conta("Conta 1", 100);
		contas[1] = new Conta("Conta 2", 100);
		contas[2] = new Conta("Conta 3", 100);
		contas[3] = new Conta("Conta 4", 100);

		System.out.println("Antes da Thread");
		System.out.println(contas[0].toString());
		System.out.println(contas[1].toString());
		System.out.println(contas[2].toString());
		System.out.println(contas[3].toString());
		System.out.println();


		GerContas gerContas = new GerContas(contas);

		Thread threadGerContas1 = new Thread(gerContas);
		threadGerContas1.start();

		Thread threadGerContas2 = new Thread(gerContas);
		threadGerContas2.start();
		


		System.out.println("Depois da Thread");
		System.out.println(contas[0].toString());
		System.out.println(contas[1].toString());
		System.out.println(contas[2].toString());
		System.out.println(contas[3].toString());

	}

	
}