import java.util.ArrayList;

public class ImprimeNThreadsCompartilhadoTest {
	
	public static int sharedCount = 0; //contador compartilhado
	public static int limit = 100; //ate onde o contador vai
	private static int amountOfThreads = 5;

	public static void main(String[] args) {
		
		ArrayList<Thread> threadsList = new ArrayList<Thread>();


		for (int i = 0; i < amountOfThreads; i++){
			Thread t = new ImprimeNThreadsCompartilhado();
			t.start();
			threadsList.add(t);
		}

		for (Thread t : threadsList){
			try{
				t.join();
			}
			catch (InterruptedException e) {}
		}
	}
}