import java.util.ArrayList;

public class SafetyVectorTest {

	public static void main(String[] args) {
		SafetyVector safetyVector = new SafetyVector();
		ArrayList<Integer> myArray = new ArrayList<Integer>();

		for (int i = 0; i < 1000; i++){
			myArray.add(i);
		}

		System.out.println("Read -> " + safetyVector.readIndex(myArray, 10));
	}
}