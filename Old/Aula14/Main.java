import java.util.ArrayList;

public class Main {

	public static Conta conta1 = new Conta("Conta 1", 100);
	public static Conta conta2 = new Conta("Conta 2", 100);

	public static void main(String[] args) {

		ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread> ();

		
		SimpleThread simpleTread1 = new SimpleThread(conta1, conta2);
		SimpleThread simpleTread2 = new SimpleThread(conta2, conta1);
		arraySimpleThread.add(simpleTread1);
		arraySimpleThread.add(simpleTread2);
		simpleTread1.start();
		simpleTread2.start();
		

		try {
			for (SimpleThread t : arraySimpleThread){
				t.join();
			}
		}
		catch (InterruptedException e){
			e.printStackTrace();
		}
		
		System.out.println(conta1);
		System.out.println(conta2);
		
	}
}