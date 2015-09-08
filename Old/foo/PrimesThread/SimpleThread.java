import java.util.ArrayList;
import java.util.List;



/* um thread que cacula os numeros primos de n ate m*/

public class SimpleThread extends Thread {

	private static int initial;
	private static int end;
	List<Integer> arrayOfPrimes = new ArrayList<> ();

	public SimpleThread(int initial, int end){
		this.initial = initial;
		this.end = end;
	}

	public boolean isPrime(int param) {
		if (param == 2) return true;
		if (param % 2 == 0) return false;
		for (int i = 3; i*i <= param; i += 2){
			if (param % i == 0) return false;
		}
		return true;
	}

	

	public void run() {
		System.out.println("initial " + SimpleThread.initial + " end " + SimpleThread.end);
		for (int j = SimpleThread.initial; j <= SimpleThread.end; j++){
			if (isPrime(j)){
				arrayOfPrimes.add(j);
			}
		}
	}

}