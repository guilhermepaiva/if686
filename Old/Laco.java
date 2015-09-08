public class Laco extends Thread {
    boolean cond = false;
 
    public static void main(String args[]) throws InterruptedException {
        Laco l = new Laco();
        l.start();        
        Thread.sleep(1);
        MalComportada mc = new MalComportada(l);
        mc.start();
    }
    public void run() {
        while (!cond) {}
        System.out.println("Saiu do laço.");
    }
}

class MalComportada extends Thread {
    private Laco l;
    private boolean imprimiu = false;

    MalComportada(Laco ll) {
        this.l = ll;
    }	
    public void run() {
        while(true) { 
          l.cond = true;
        }
    }

}