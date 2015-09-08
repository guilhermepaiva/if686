import java.util.ArrayList;
import java.util.List;
import java.lang.Thread;
import java.util.Arrays;

public class MainThread extends Thread {

	int n = MainThreadTest.n;
	int x = MainThreadTest.x;

	public void run() {

		int shift = n / x;
		int initial = 1;
		int ending = shift;
		List<List<Integer>> finalArrayOfPrimes = new ArrayList<> ();
		ArrayList<SimpleThread> simpleThreadArray = new ArrayList<SimpleThread> ();
		
		while (x > 0){
			
			SimpleThread simpleThread = new SimpleThread(initial, ending);
			simpleThread.start();
			List<Integer> temp = simpleThread.arrayOfPrimes;
			finalArrayOfPrimes.add(temp);
			simpleThreadArray.add(simpleThread);
			initial = ending + 1;
			ending = ending + shift;
			x--;


			try {
				for (SimpleThread t : simpleThreadArray){
					t.join();
				}
			} catch (InterruptedException e){
			// nothing for the moment
			}

		}

		

		System.out.println(Arrays.toString(finalArrayOfPrimes.toArray()));
	}

}