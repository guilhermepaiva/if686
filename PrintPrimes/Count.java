public class Count {

	private long value;

	public Count(int value){
		this.value = value;
	}

	public long getAndIncrement() {
		return value++;
	}
}