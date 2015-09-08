import java.lang.Thread;

public class BlocoGuardado extends Thread{

	public BlocoGuardado () {}

	public synchronized void guarda(){
		boolean condicao = false;
		while (!condicao){
			try {
				wait();	
			}
			catch (InterruptedException e){
				e.printStackTrace();
			}
			
		}
		System.out.println("Condicao e eficiencia satisfeita...");

	}

}