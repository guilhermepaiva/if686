public class Arvore {

	public int valor;
	public Arvore esquerda;
	public Arvore direita;

	public Arvore (int v, Arvore e, Arvore d){
		this.valor = v;
		this.esquerda = e;
		this.direita = d;
	}

	private Arvore (int v) {
		this.valor = v;
		this.esquerda = null;
		this.direita = null;
	}

	public Arvore () {}

	public int getValor () {
		return valor;
	}

	public void setValor (int valor) {
		this.valor = valor;
	}

	public Arvore getEsquerda () {
		return esquerda;
	}

	public void setEsquerda (Arvore e){
		this.esquerda = e;
	}

	public Arvore getDireita () {
		return direita;
	}

	public void setDireita (Arvore d){
		this.direita = d;
	}

	public synchronized void inserir (Arvore tree, int valor) {
		if (valor < tree.getValor()){
			
			if (tree.getEsquerda() != null){
				inserir(tree.getEsquerda(), valor);
			} else {
				tree.setEsquerda (new Arvore (valor));
			}

		} else {
			if (tree.getDireita() != null) {
				inserir(tree.getDireita(), valor);
			} else {
				tree.setDireita(new Arvore(valor));
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