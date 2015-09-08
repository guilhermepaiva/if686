
public class ProdutorConsumidorTest {

	public static void main (String[] args){
		Drop drop = new Drop();
		(new Thread(new Produtor(drop))).start();
		(new Thread(new Consumidor(drop))).start();
	}
}