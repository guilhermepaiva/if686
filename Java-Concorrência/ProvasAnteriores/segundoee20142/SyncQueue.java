import java.util.concurrent.locks.*;
import java.util.ArrayList;

public class SyncQueue<T> {

	private T item = null;
	private boolean enqueuing = false;
	private Lock lock = new ReentrantLock();
	private Condition condition = lock.newCondition();

	public void push(T value) throws InterruptedException {
		lock.lock();

		try {

			while (enqueuing) {
				condition.await();
			}

			enqueuing = true;
			item = value;
			condition.signalAll();

			while (item != null) {
				condition.await();
			}
			enqueuing = false;
			condition.signalAll();

		} finally {
			lock.unlock();
		}
	}

	public T pop() throws InterruptedException {
		lock.lock();

		try {

			while (item == null){
				condition.await();
			}

			T t = item;
			item = null;
			condition.signalAll();
			return t;


		} finally {
			lock.unlock();
		}
	}

	public static void main(String[] args) {
	
		final SyncQueue<Integer> sc = new SyncQueue<Integer>();

		Thread producer = new Thread (new Runnable () {
			public void run () {
				for (int i = 0; i < 10; i++){
					try {
						sc.push(new Integer(i));
					} catch (InterruptedException e) {}
				}
			}
		});

		producer.start();

		final ArrayList<Integer> al = new ArrayList<Integer>();

		Thread consumer = new Thread (new Runnable (){
			public void run() {
				for (int i = 0; i < 10; i++){
					try {
						al.add(sc.pop());
					} catch (InterruptedException e) {}
				}
			}
		});		

		consumer.start();

		try {
			consumer.join();
		} catch (InterruptedException e) {};

		for (Integer x : al) {
			System.out.println(x);
		}


	}

	

}








