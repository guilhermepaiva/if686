public class Counter {

	private long value;

	public Counter(long v){
		this.value = v;
	}

	public long getAndIncrement () {
		return value++;
	}
}