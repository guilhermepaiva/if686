import java.util.ArrayList;

public class Main {

	public static Tree tree = new Tree();

	public static void main(String[] args) {

		ArrayList<SimpleThread> arraySimpleThread = new ArrayList<SimpleThread> ();

		for (int i = 0; i < 5; i++){
			SimpleThread simpleThread = new SimpleThread();
			arraySimpleThread.add(simpleThread);
			simpleThread.start();
		}

		try {
			for (SimpleThread t : arraySimpleThread){
				t.join();
			}
		}
		catch (InterruptedException e){
				e.printStackTrace();
		}
		

		String resultTree = tree.printTree();

		System.out.println("Arvore final: " + resultTree);
		
	}
}