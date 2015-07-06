import java.lang.Thread;

public class SimpleThread extends Thread {

	Count count =  new Count(1);

	public void run() {
		long j = 0;

		while (j <= 100) {
			j = count.getAndIncrement();
			if (isPrime(j)){
				System.out.println(j);
			}
		}

	}

	public boolean isPrime(long param) {
		if (param == 2) return true;
		if (param % 2 == 0) return false;
		for (int i = 3; i*i <= param; i += 2){
			if (param % i == 0) return false;
		}
		return true;
	}
}