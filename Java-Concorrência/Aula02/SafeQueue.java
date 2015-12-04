public class SafeQueue {

	int value;
	SafeQueue next;

	public SafeQueue () {
		this.value = -1;
		this.next = null;
	}

	public SafeQueue (int v) {
		this.value = v;
		this.next = null;
	}

	public synchronized SafeQueue insert (int x) {
		if (this.value == -1){
			this.value = x;
		}
		else if (this.next == null){
			this.next = new SafeQueue (x);
		}
		else {
			this.next = next.insert(x);
		}

		return this;
	}

	public String printQueue () {
		if (next != null) {
			return value + " " + next.printQueue();
		}
		else {
			return value + " ";
		}
	}
	
}
