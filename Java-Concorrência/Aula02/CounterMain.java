import java.util.ArrayList;

public class CounterMain {

	public static void main(String[] args) {

		ArrayList<CounterThread> arrayCounterThread = new ArrayList<CounterThread>();
		int amountOfThreads = 5;

		for (int i = 0; i < amountOfThreads; i++){
			CounterThread counterThread = new CounterThread();
			counterThread.start();
			arrayCounterThread.add(counterThread);
		}

		for (CounterThread t : arrayCounterThread){
			try {
				t.join();
			}
			catch (InterruptedException e) {}
		}
	}
}