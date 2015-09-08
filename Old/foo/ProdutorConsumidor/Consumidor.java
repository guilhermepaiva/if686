import java.util.Random;

public class Consumidor implements Runnable {
    private Drop drop;

    public Consumidor(Drop drop) {
        this.drop = drop;
    }

    public void run() {
        Random random = new Random();
        for (String message = drop.take(); ! message.equals("Fim");
                message = drop.take()) {
            System.out.format("Mensagem recebida: %s%n", message);
            try {
                Thread.sleep(random.nextInt(500));                
            } catch (InterruptedException e) {}
        }
        
        System.out.println("Mensagens Lidas");
    }
}
