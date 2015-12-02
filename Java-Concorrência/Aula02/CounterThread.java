public class CounterThread extends Thread {

	public void run () {
		long j = 0;
		while (j < 10) {
			j = CounterMain.counter.getAndIncrement();
			if (isPrime(j)) {
				System.out.println(j);
			}
		}
	}

	public boolean isPrime (long n){
		int divisors = 0;
		for (int i = 1; i <= n; i++){
			if (n%i == 0){
				divisors++;
			}
		}

		if (divisors == 2) {
			return true;
		}
		else {
			return false;
		}
	}

}