import java.util.Scanner;
import java.util.ArrayList;

public class ImprimeNPrimosTest {

	public static int n;

	public static void main(String[] args) {
		System.out.println("Digite o argumento N (primos a serem impressos de 1 a N):");
		Scanner scannerN = new Scanner(System.in);
		n = scannerN.nextInt();

		System.out.println("Digite a quantidade de Threads para processar esse trabalho:");
		Scanner scannerX = new Scanner(System.in);
		int x = scannerX.nextInt();

		ArrayList<Thread> threadsList = new ArrayList<Thread>();

		

		for (int i = 0; i < x; i++){
			
			Thread t = new ImprimeNPrimos();
			t.start();
		}

		for (Thread t : threadsList){
			try {
				t.join();
			}
			catch (InterruptedException e) {}
		}

		
		

	}
}