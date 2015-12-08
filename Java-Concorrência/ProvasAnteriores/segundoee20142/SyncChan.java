import java.util.Random;
import java.util.concurrent.locks.*;
import java.util.ArrayList;

public class SyncChan {

	public static Queue queue = new Queue();

	public static void main (String[] args){
		ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread>();

		for (int i = 0; i < 10; i++){
			SimpleThread simpleThread = new SimpleThread();
			arraySimpleThread.add(simpleThread);
			simpleThread.start();
		}

		try {
			for (SimpleThread t : arraySimpleThread){
				t.join();
			} 
			System.out.println("Programa finalizado..");
		} catch (InterruptedException e) {}

	}

}

class Queue {

	int value;

	public Queue (int v) {
		this.value = v;
	}

	public Queue () {
		this.value = -1; //significa que a fila está vazia
	}

	public synchronized void push (int v) throws InterruptedException {
		if (this.value == -1) { // a fila está vazia, pode inserir
			this.value = v;
			System.out.println("A fila estava vazia, " + v + " foi inserido!");
		} else {
			System.out.println("A fila tem um elemento...espere o pop...");
			wait();
		}
	}

	public synchronized void pop () throws InterruptedException {
		if (this.value != -1) { //se a fila não estiver vazia pode tirar
			System.out.println("O elemento " + this.value + " foi retirado da fila!");
			this.value = -1;
		} else { // se a fila estiver vazia espere um push
			System.out.println("A fila está vazia, espere um push...");
			wait();
		}

	}
}

class SimpleThread extends Thread {
	public void run () {

		Random random  = new Random();
		int randomNumber = random.nextInt(10) + 1;

		boolean probability = random.nextBoolean();

		if (probability == true){
			try {
				SyncChan.queue.push(randomNumber);
			} catch (InterruptedException e) {}

			synchronized (this){
			notifyAll();
		}

		} else {
			try {
				SyncChan.queue.pop();
			} catch (InterruptedException e) {}
		}

		synchronized (this){
			notifyAll();
		}

		
	}
}