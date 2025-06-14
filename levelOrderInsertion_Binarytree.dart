//membuat class node pada tree
import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

//membangun binary treenya
class BinaryTree<T> {
  Node<T>? root;

  //traversal preorder
  void printPreOrder(Node? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} ');
      printPreOrder(node.left);
      printPreOrder(node.right);
    }
  }

  //traversal inorder
  void printInOrder(Node? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write('${node.nodeValue} ');
      printInOrder(node.right);
    }
  }

  //traversal postorder
  void printPostOrder(Node? node) {
    if (node != null) {
      printPostOrder(node.left);
      printPostOrder(node.right);
      stdout.write('${node.nodeValue} ');
    }
  }

  //menambahkan berdasarkan level order(queue)
  void addLevelOrder(T nodeValue) {
    Node<T> newNode = Node(nodeValue);
    if (root == null) {
      root = newNode;
      return;
    }

    List<Node<T>> queue = [];
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeAt(0);

      if (current.left == null) {
        current.left = newNode;
        break;
      } else {
        queue.add(current.left!);
      }

      if (current.right == null) {
        current.right = newNode;
        break;
      } else {
        queue.add(current.right!);
      }
    }
  }

//buat find node
  Node<T>? findNode(Node<T>? currentNode, T target) {
    if (currentNode == null) return null;
    if (currentNode.nodeValue == target) return currentNode;
    Node<T>? hasilDikiri = findNode(currentNode.left, target);
    if (hasilDikiri != null) return hasilDikiri;

    return findNode(currentNode.right, target);
  }

  //menambahkan berdasarkan tergett
  bool addByTarget(T targetValue, T newNodeValue, {bool addToLeft = true}) {
    if (root == null) return false;

    Node<T>? targetNode = findNode(root, targetValue);
    if (targetNode == null) return false;

    if (addToLeft) {
      if (targetNode.left == null) {
        targetNode.left = Node(newNodeValue);
      } else {
        // Jika sudah ada node di kiri, tambahkan sebagai anak dari node tersebut
        targetNode.left!.left = Node(newNodeValue);
      }
    } else {
      if (targetNode.right == null) {
        targetNode.right = Node(newNodeValue);
      } else {
        // Jika sudah ada node di kanan, tambahkan sebagai anak dari node tersebut
        targetNode.right!.right = Node(newNodeValue);
      }
    }
    return true;
  }

  // traversal preorder non-rekursif
  void printPreOrderIterative() {
    if (root == null) return;

    List<Node<T>> stack = [];
    stack.add(root!);

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      stdout.write('${current.nodeValue} ');

      // Push right first supaya left diproses lebih dulu
      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
  }

// traversal inorder non-rekursif
  void printInOrderIterative() {
    List<Node<T>> stack = [];
    Node<T>? current = root;

    while (current != null || stack.isNotEmpty) {
      // masukkan semua node kiri ke stack
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      current = stack.removeLast();
      stdout.write('${current.nodeValue} ');
      current = current.right;
    }
  }

// traversal postorder non-rekursif
  void printPostOrderIterative() {
    if (root == null) return;

    List<Node<T>> stack1 = [];
    List<Node<T>> stack2 = [];

    stack1.add(root!);

    while (stack1.isNotEmpty) {
      Node<T> current = stack1.removeLast();
      stack2.add(current);

      if (current.left != null) stack1.add(current.left!);
      if (current.right != null) stack1.add(current.right!);
    }

    // output dari stack2 adalah postorder
    while (stack2.isNotEmpty) {
      stdout.write('${stack2.removeLast().nodeValue} ');
    }
  }

  int maxDept(Node? node) {
    if (node == null) {
      return 0;
    } else {
      int leftdept = maxDept(node.left);
      int rightdept = maxDept(node.right);
      return leftdept > rightdept ? leftdept + 1 : rightdept + 1;
    }
  }

  //menghapus data pada binary tree
  void deleteDeepest(Node<T>? root, Node<T> deleteNode) {
    if (root == null) return;

    List<Node<T>> queue = [];
    queue.add(root);

    while (queue.isNotEmpty) {
      Node<T> temp = queue.removeAt(0);

      if (temp.left != null) {
        if (temp.left == deleteNode) {
          temp.left = null;
          return;
        } else {
          queue.add(temp.left!);
        }
      }
      if (temp.right != null) {
        if (temp.right == deleteNode) {
          temp.right = null;
          return;
        } else {
          queue.add(temp.right!);
        }
      }
    }
  }

  void delete(T key) {
    if (root == null) return;

    // Kasus hanya ada root
    if (root!.left == null && root!.right == null) {
      if (root!.nodeValue == key) {
        root = null;
      }
      return;
    }

    List<Node<T>> queue = [];
    queue.add(root!);

    Node<T>? temp;
    Node<T>? keyNode;

    // Cari node yang nilainya == key, dan simpan node terakhir (terdalam)
    while (queue.isNotEmpty) {
      temp = queue.removeAt(0);

      if (temp.nodeValue == key) {
        keyNode = temp;
      }

      if (temp.left != null) queue.add(temp.left!);
      if (temp.right != null) queue.add(temp.right!);
    }

    // Jika ditemukan node yang ingin dihapus
    if (keyNode != null && temp != null) {
      keyNode.nodeValue = temp.nodeValue; // Ganti nilai dengan node terdalam
      deleteDeepest(root, temp); // Hapus node terdalam
    }
  }
}

//mainnya
void main() {
  BinaryTree tree = BinaryTree();
  tree.addLevelOrder(1);
  tree.addLevelOrder(2);
  tree.addLevelOrder(3);
  tree.addLevelOrder(4); //menambahkan 4 menjadi child dari 2 sebelah kiri
  tree.addLevelOrder(5); // menambahkan 5 menjadi child dari 2 sebelah kanan
  tree.addByTarget(3, 12); // menambahkan 12 menjadi child dari  6 sebelah kiri

  print('Preorder traversal of binary tree is: ');
  tree.printPreOrder(tree.root);

  print('\nPreorder traversal non rekursif: ');
  tree.printPreOrderIterative();

  print('\ninorder traversal of binary tree is: ');
  tree.printInOrder(tree.root);
  print('\ninorder traversal non rekursif: ');
  tree.printInOrderIterative();

  print('\nPostorder traversal of binary tree is: ');
  tree.printPostOrder(tree.root);
  print('\nPostorder traversal non rekursif: ');
  tree.printPostOrderIterative();

  print('\nin order traversal after of binary tree is: ');
  tree.delete(2);

  tree.printPostOrder(tree.root);
  print('kedalaman binary tree : ${tree.maxDept(tree.root)}');
}
