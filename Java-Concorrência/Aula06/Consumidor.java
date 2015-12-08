public class Consumidor extends Thread {

	private CubbyHole cubbyHole;
	private int numero;

	public Consumidor (CubbyHole c, int numero){
		cubbyHole = c;
		this.numero = numero;
	}

	public void run () {
		int value = 0;
		for (int i = 0; i < 10; i++){
			value = cubbyHole.get(numero);
		}
	}
}