import java.util.concurrent.locks.*;
import java.util.ArrayList;

public class SafetyVector {

	Lock lock;


	public int readIndex(ArrayList<Integer> array, int i){
		return array.get(i);
	}
	
}