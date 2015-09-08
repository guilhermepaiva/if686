import java.util.Scanner;

public class MainThreadTest {

	public static int n;
	public static int x;

	public static void main(String[] args) {

		
		System.out.println("Digite o valor para n: ");
		Scanner scanner = new Scanner(System.in);
		n = scanner.nextInt();
		System.out.println("Digite o valor para x: ");
		x = scanner.nextInt();

		(new MainThread()).start();

	}
}