public class ImprimeNThreadsCompartilhado extends Thread {

	public void run () {
		while (ImprimeNThreadsCompartilhadoTest.sharedCount <= ImprimeNThreadsCompartilhadoTest.limit){
			System.out.println("sharedCount: " + ImprimeNThreadsCompartilhadoTest.sharedCount);
			ImprimeNThreadsCompartilhadoTest.sharedCount++;
		}
	}
}