public class BinaryTree {

	static class Node {
		Node left;
		Node right;
		int value;

		public Node (int value){
			this.value = value;
		}

	}

	public void insert(Node node, int value) {
		if (value < node.value){
			if (node.left != null){
				insert(node.left, value);
			}
			else{
				node.left = new Node(value);
				System.out.println("Inseriu " + value + " a esquerda de " + node.value);
			}
		}
		else if (value > node.value){
			if (node.right != null){
				insert(node.right, value)
			}
			else{

			}

		}
		else {

		}

	}
}