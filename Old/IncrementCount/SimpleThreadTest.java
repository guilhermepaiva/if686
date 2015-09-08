import java.util.Scanner;
import java.util.ArrayList;

public class SimpleThreadTest {

	static int n = 10; //numero de threads

	public static void main(String[] args) {

		ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread> (); 

		System.out.println("Digite o valor de x");
		Scanner scanner = new Scanner(System.in);
		int x = scanner.nextInt();
		scanner.close();

		for (int i = 0; i < n; i++){
			SimpleThread simpleThread = new SimpleThread(i, x);
			arraySimpleThread.add(simpleThread);
			simpleThread.start();
		}

	}
}