public class ThreadSampleTest {
	public static int count = 0;

	public static void main(String[] args) {
		(new ThreadSample()).start();
		(new ThreadSample()).start();
	}
}