public class ImprimeCemThreadTest {

	public static int count = 0;

	public static void main(String[] args) {

		for (int i = 1; i <= 100; i++){
			(new ImprimeCemThread()).start();
			count++;
		}

	}
}