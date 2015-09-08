
public class Tree {
	int value;
	Tree left, right;

	public Tree() {
		this.value = -1;
		this.left = null;
		this.right = null;
	}

	public Tree (int val) {
		this.value = val;
		this.right = null;
		this.left = null;
	}

	public synchronized Tree insert (int value) {
		if (this.value == -1){
			this.value = value;
		}
		else if (this.value > value){
			if (this.left != null){
				this.left = this.left.insert(value);
			} 
			else {
				this.left = new Tree(value);
			}
		}
		else if (this.value < value){
			if (this.right != null){
				this.right = this.right.insert(value);
			}
			else {
				this.right = new Tree(value);
			}
		}

		return this;
	}

	public String printTree() {
		if (left != null && right != null){
			return left.printTree() + " " + value + " " + right.printTree();
		}
		else if (left != null && right == null){
			return left.printTree() + " " + value;
		}
		else if (left == null && right != null){
			return value + " " + right.printTree();
		}
		else {
			return value + " ";
		}
	}

}