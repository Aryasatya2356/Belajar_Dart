import 'dart:io';

class STNode<T> {
  T nodeValue;
  STNode<T>? left, right, parent;
  STNode(this.nodeValue, [this.parent]);
}

class BinarySearchTree<T extends Comparable<dynamic>> {
  STNode<T>? root;
  int treeSize = 0;

  BinarySearchTree();

  bool add(T item) {
    STNode<T>? t = root;
    STNode<T>? parent;
    int orderValue = 0;

    while (t != null) {
      parent = t;
      orderValue = item.compareTo(t.nodeValue);
      if (orderValue == 0) {
        return false;
      } else if (orderValue < 0) {
        t = t.left;
      } else {
        t = t.right;
      }
    }

    STNode<T> newNode = STNode(item, parent);
    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    treeSize++;
    return true;
  }

  //finddnode
  STNode<T>? findNode(T item) {
    STNode<T>? t = root;
    int orderValue = 0;

    while (t != null) {
      orderValue = item.compareTo(t.nodeValue);

      if (orderValue == 0) {
        return t;
      } else if (orderValue < 0) {
        t = t.left;
      } else {
        t = t.right;
      }
    }
    return null;
  }

  //find
  bool find(T item) {
    STNode<T>? t = findNode(item);
    if (t != null) {
      T value = t.nodeValue;
      return true;
    }
    return false;
  }

  //remove
  void removeNode(STNode<T>? dNode) {
    if (dNode == null) return;

    STNode<T>? pNode = dNode.parent;
    STNode<T>? rNode;

    // Node punya satu anak atau tidak punya
    if (dNode.left == null || dNode.right == null) {
      if (dNode.right == null) {
        rNode = dNode.left;
      } else {
        rNode = dNode.right;
      }

      if (rNode != null) {
        rNode.parent = pNode;
      }

      if (pNode == null) {
        root = rNode;
      } else if (dNode.nodeValue.compareTo(pNode.nodeValue) < 0) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }
    }

    // Node punya dua anak
    else {
      STNode<T>? pOfRNode = dNode;
      rNode = dNode.right;

      while (rNode!.left != null) {
        pOfRNode = rNode;
        rNode = rNode.left;
      }

      dNode.nodeValue = rNode.nodeValue;

      if (pOfRNode == dNode) {
        dNode.right = rNode.right;
      } else {
        pOfRNode!.left = rNode.right;
      }

      if (rNode.right != null) {
        rNode.right!.parent = pOfRNode;
      }
    }
    treeSize--;
  }

  //inorder
  void inOrderDisplay(STNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left);
      stdout.write('${node.nodeValue} ');
      inOrderDisplay(node.right);
    }
  }

  STNode<T>? getRoot() {
    return root;
  }

  //fisrt mencari nilai terkecil
  T? first() {
    if (root == null) return null;

    STNode<T>? current = root;
    while (current!.left != null) {
      current = current.left;
    }
    return current.nodeValue;
  }
}

void main() {
  BinarySearchTree<int> bst = BinarySearchTree();
  bst.add(35);
  bst.add(18);
  bst.add(25);
  bst.add(48);
  bst.add(20);

  STNode<int>? rootNode =
      bst.getRoot(); // Atau gunakan getRoot() jika kamu buat method-nya

  if (rootNode != null) {
    print('Root Value: ${rootNode.nodeValue}');
  } else {
    print('The tree is empty.');
  }

  print('\nInOrder Display:');
  bst.inOrderDisplay(bst.getRoot()); // Panggil lewat objek, bukan class

  // Hapus node bernilai 20
  STNode<int>? nodeToRemove = bst.findNode(20);
  bst.removeNode(nodeToRemove);
  print('\nInOrder Display After Deletion:');
  bst.inOrderDisplay(bst.getRoot());
  int? minValue = bst.first();
  print("\nNilai terkecil di BST adalah: $minValue");
}
