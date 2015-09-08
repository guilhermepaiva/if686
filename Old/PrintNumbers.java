public class PrintNumbers {

	/*
	exercício da aula modificado: Implemente um programa que imprime todos os números entre 1 e 2 bilhões usando várias threads para particionar o trabalho.
	*/

	private static Object lock = new Object();

	public static void main(String[] args) {

		Runnable first_runnable = new Runnable() {
			@Override
			public void run(){
				for (int i = 1; i <= 20; i = i + 2){
					synchronized (lock) {
						System.out.println("Thread 1: " + i);
						try	{
							lock.notifyAll();
							lock.wait();
						}
						catch (InterruptedException e){
							System.out.println("Erro na primeira thread: " + e.getMessage());
						}
					}
				}
			}
		};

		Runnable second_runnable = new Runnable() {
			@Override
			public void run() {
				for (int i = 2; i <= 20; i = i +2){
					synchronized (lock){
						System.out.println("Thread 2: " + i);
						try {
							lock.notifyAll();
							lock.wait();
						}
						catch (InterruptedException e){
							System.out.println("Erro na segunda thread: " + e.getMessage());
						}

					}
				}
			}
		};


		Thread first_thread = new Thread(first_runnable);
		Thread second_thread = new Thread(second_runnable);

		System.out.println("Inicio da Thread: ");
		first_thread.start();
		second_thread.start();

		
	}

}