import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Lock;

public class Arvore {

	public int valor;
	public Arvore esquerda;
	public Arvore direita;
	private Lock lockEsquerda = new ReentrantLock();
	private Lock lockDireita = new ReentrantLock();

	public Arvore (int v, Arvore e, Arvore d) {
		this.valor = v;
		this.esquerda = e;
		this.direita = d;
	}

	public Arvore () {}

	public Arvore (int v) {
		this.valor = v;
		this.esquerda = null;
		this.direita = null;
	}

	public int getValor () {
		return valor;
	}

	public void setValor (int v){
		this.valor = v;
	}

	public Arvore getEsquerda () {
		return esquerda;
	}

	public void setEsquerda (Arvore e) {
		this.esquerda = e;
	}

	public Arvore getDireita () {
		return direita;
	}

	public void setDireita (Arvore d) {
		this.direita = d;
	}

	public void inserir (Arvore tree, int valor) {
		
		if (valor < tree.getValor()){
		
		if (tree.getEsquerda() != null){
			inserir(tree.getEsquerda(), valor);
		} else {
			
			try	{
				tree.lockEsquerda.lock();
				tree.setEsquerda (new Arvore (valor));
			} finally {
				tree.lockEsquerda.unlock();
			}
			
		}

		
		}
			
		else {
			if (tree.getDireita() != null) {
				inserir(tree.getDireita(), valor);
			} else {
				try{
					tree.lockDireita.lock();
					tree.setDireita(new Arvore(valor));
				} finally {
					tree.lockDireita.unlock();
				}
			}
		}
		
	}

	public static void prefixado(Arvore no) { 
		if(no != null){ 
			System.out.print(no.getValor() + " ");
			prefixado(no.getEsquerda()); 
			prefixado(no.getDireita());
		} 
	}
}