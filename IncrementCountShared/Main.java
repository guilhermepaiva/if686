import java.util.Scanner;
import java.util.ArrayList;

public class Main {

	public static int count;
	static int n; //numero de threads
	static int x; //ate onde o contador vai
	public static int i;

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		System.out.println("Digite o numero de threads:");
		n = scanner.nextInt();
		System.out.println("Digite ate onde o contador vai:");
		x = scanner.nextInt();
		
		count = 1;
		
		ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread> ();

		for (i = 0; i <= x; i++){
			SimpleThread simpleThread = new SimpleThread();
			arraySimpleThread.add(simpleThread);
			simpleThread.start();

		}
	}
}