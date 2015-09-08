public class BlockingQueue implements Queue {

	private java.util.Queue = queue = new java.util.LinkedList();


	public synchronized Object dequeue() {
		Object msg = null;
		while (queue.isEmpty()){
			try {
				wait();
			}
			catch (InterruptedException e){
				e.printStackTrace();
				return msg;
			}
		}

		msg = queue.remove();
		return msg;
	}

	public synchronized void enqueue (Object o){
		queue.add(o);
		notifyAll(); //acorda qualquer thread que estiver esperando para colocar na fila
	} 
}