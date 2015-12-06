import java.util.Random;

public class ArvoreMain extends Thread {

	public Arvore arvore = new Arvore ();

	public void run () {

		for (int i = 0; i < 2000; i++){
			arvore.inserir(arvore, randInt());
		}

	}

	public static int randInt() {
		int min = 1;
		int max = 55000;

	    Random rand = new Random();

	    int randomNum = rand.nextInt((max - min) + 1) + min;

	    return randomNum;
	}

	public static void main(String[] args) {
		long inicio = System.currentTimeMillis();

		for (int i = 0; i < 50; i++){
			Thread t = new Thread(new ArvoreMain());
			t.start();
		}

		long fim = System.currentTimeMillis();

		System.out.println("tempo gasto = "+ (fim - inicio) + "ms");
	}
}