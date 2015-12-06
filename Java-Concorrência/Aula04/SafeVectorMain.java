import java.util.ArrayList;

public class SafeVectorMain {

	public static Vector safeVector = new Vector(1000);

	public static void main(String[] args) {
		
		ArrayList<ThreadSampleVector> threadArrayList = new ArrayList<ThreadSampleVector>();

		// 10 threads
		for (int i = 0; i < 10; i++){
			ThreadSampleVector threadSampleVector = new ThreadSampleVector();
			threadArrayList.add(threadSampleVector);
			threadSampleVector.start();
		}

		try {
			for (ThreadSampleVector t : threadArrayList){
				t.join();
			}

			System.out.println(safeVector.printVector());
		}
		catch (InterruptedException e) {}


	}



}