public class Producer implements Runnable {

	private Queue queue = null;

	public void run(){
		// ...
	}

	public void doSomething(Object msg){
		queue.enqueue(msg);
	}
}