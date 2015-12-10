import java.util.concurrent.locks.*;
import java.util.ArrayList;

public class SyncChannel {

	private int valorInserido;
	private boolean blockedWriter = false;
	private boolean blockedReader = false;

	private boolean busyWriter = false;
	private boolean busyReader = false;
	
	private Lock aLock = new ReentrantLock();

	private Condition readerNotificator = aLock.newCondition();
	private Condition writerNotificator = aLock.newCondition();
	private Condition busyReaderCond = aLock.newCondition();
	private Condition busyWriterCond = aLock.newCondition();

	public SyncChannel () {
		this.valorInserido = -1;
	}

	public SyncChannel (int v) {
		this.valorInserido = v;
	}

	//public T pop() throws InterruptedException
	public int pop () throws InterruptedException {
		aLock.lock();
		//T result = null;
		int result;

		try {
			while (busyReader){
				this.busyReaderCond.await();
			}

			this.busyReader = true;

			if (this.blockedWriter) {
				result = this.valorInserido;
				blockedWriter = false;
				this.writerNotificator.signalAll();
			} else {
				this.blockedReader = true;
				while (blockedReader){
					this.readerNotificator.await();
				}

				//result = this.element;
				result = this.valorInserido;
				this.writerNotificator.signalAll();
			}

			return result;

		} finally {
			this.aLock.unlock();
		}

	}

	public void push (int who) throws InterruptedException {

		aLock.lock();

		try {

			while (busyWriter) {
				this.busyWriterCond.await();
			}

			this.busyWriter = true;

			if (this.blockedReader) {
				blockedReader = false;
				this.readerNotificator.signalAll();
			} else {
				this.blockedWriter = true;
				while (blockedWriter) {
					this.writerNotificator.await();
				}

				this.valorInserido = who;
				this.writerNotificator.signalAll();
			}
		} finally {
			aLock.unlock();
		}

	}

	public static void main (String[] args) {

		final SyncChannel sc = new SyncChannel();

		Thread producer = new Thread (new Runnable (){
			public void run () {
				for (int i = 0; i < 10; i++){
					try {
						sc.push(i);
					} catch (InterruptedException e) {}
				}
			}
		});

		producer.start();

		final ArrayList<Integer> al = new ArrayList<Integer>();

		Thread consumer = new Thread (new Runnable(){
			public void run () {
				for (int i =0; i < 10; i++){
					try {
						al.add(sc.pop());
					} catch (InterruptedException e) {}
				}
			}
		});

		consumer.start();

		try {
			consumer.join();
		} catch (InterruptedException e) {}

		for (int x : al){
			System.out.println(x);
		}
			
	}
}