import java.lang.Thread;

public class SimpleThread extends Thread {

	static int n;
	static int count;
	static int i;
	static int j;


	public SimpleThread(int n, int count){
		this.n = n;
		this.count = count;
	}

	public void run() {

		i = 1;
		j = SimpleThread.count;

		while (j > 0){
			System.out.println("Contador da Thread " + SimpleThread.n);
			System.out.println(i);
			System.out.println();
			i++;
			j--;
		}

	}
}