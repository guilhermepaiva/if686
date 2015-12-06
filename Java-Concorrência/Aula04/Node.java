import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Lock;

public class Node {

	public int value;
	public int position;
	Lock lock;

	public Node () {}

	public Node (int v, int p){
		this.value = v;
		this.position = p;
		this.lock = new ReentrantLock();
	}
}