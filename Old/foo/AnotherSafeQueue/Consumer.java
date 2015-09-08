public class Consumer implements Runnable {

	private Queue queue = null;

	public void process(Object msg){
		try {

		} catch (InterruptedException e){
			e.printStackTrace();
		}
	}

	public void run(){
		while(true){
			doStuff();
		}
	}

	public void doStuff(){
		Object msg = queue.dequeue();
		process(msg);
	}
}