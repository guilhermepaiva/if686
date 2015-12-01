public class ImprimeNThreadsNaoCompartilhado extends Thread {


	public static int notSharedCount = 30;

	public void run () {

		for (int i = 0; i <= notSharedCount; i++){
			System.out.println("notSharedCount: " + i);
		}
	}
}