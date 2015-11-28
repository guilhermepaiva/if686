public class ImprimeNPrimos extends Thread {

	public void run () {
		for (int i = 1; i <= ImprimeNPrimosTest.n; i++){
			if (testaPrimalidade(i) == true){
				System.out.println(i);
			}
		}
	}

	public boolean testaPrimalidade (int x) {
		int count = 0;
		for (int i = 1; i <= x; i++){
			if (x%i == 0){
				count++;
			}
		}
		if (count == 2){
			return true;
		}
		else {
			return false;
		}
	}
}