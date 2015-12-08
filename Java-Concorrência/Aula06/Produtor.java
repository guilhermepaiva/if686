public class Produtor extends Thread {

	private CubbyHole cubbyHole;
	private int numero;

	public Produtor (CubbyHole c, int numero) {
		cubbyHole = c;
		this.numero = numero;
	}

	public void run () {
		for (int i = 0; i < 10; i++){
			cubbyHole.put(numero, i);
			try {
				sleep((int)(Math.random()*100));
			} catch (InterruptedException e) {}
		}
	}

}