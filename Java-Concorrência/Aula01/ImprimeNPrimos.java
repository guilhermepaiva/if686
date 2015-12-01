public class ImprimeNPrimos extends Thread {

	public void run () {
		while (ImprimeNPrimosTest.sharedCount <= ImprimeNPrimosTest.n){
			if (testaPrimalidade(ImprimeNPrimosTest.sharedCount) == true){
				System.out.println(ImprimeNPrimosTest.sharedCount);
			}
			ImprimeNPrimosTest.sharedCount++;
		}
		
	}

	private boolean testaPrimalidade (int x) {
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