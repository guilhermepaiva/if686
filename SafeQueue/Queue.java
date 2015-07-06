public class Queue {

	int value;
	Queue next;

	public Queue(int value){
		this.value = value;
		this.next = null;
	}

	public Queue(){
		this.value = -1;
		this.next = null;
	}

	public synchronized Queue insert(int value){
		if (this.value == -1){
			this.value = value;
		}
		else if (this.next == null){
			this.next = new Queue(value);
		}
		else{
			this.next = next.insert(value);
		}
		return this;
	}


	public String print() {
		if (next != null){
			return value + " " + next.print();
		}
		else{
			return value + "";
		}
	}



}