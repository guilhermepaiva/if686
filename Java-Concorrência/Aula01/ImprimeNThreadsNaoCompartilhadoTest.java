import java.util.ArrayList;


public class ImprimeNThreadsNaoCompartilhadoTest {

	public static int amountOfThreads  = 10;

	public static void main(String[] args) {
		
		

		ArrayList<Thread> threadsList = new ArrayList<Thread>();

		for (int i = 0; i <= amountOfThreads; i++){
			Thread t = new ImprimeNThreadsNaoCompartilhado();
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