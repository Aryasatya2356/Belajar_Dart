import 'dart:io';

class Node<T> {
  T? nodeValue;
  Node<T>? next;

//default constructor with no initial value
  Node() {
    nodeValue = null;
    next = null;
  }

//initialize nodeValue to item set next to null
  Node.withValue(T item) {
    nodeValue = item;
    next = null;
  }
}

class Linkedlist<T> {
  Node<T>? head;

  bool isEmpty() => head == null;

  void insertFront(T data) {
    Node<T> baru = Node.withValue(data);
    if (isEmpty()) {
      head = baru;
    } else {
      baru.next = head;
      head = baru;
    }
  }

  void printLinkedList() {
    if (!isEmpty()) {
      Node<T>? sekarang = head;
      while (sekarang != null) {
        stdout.write('${sekarang.nodeValue} ');
        sekarang = sekarang.next;
      }
      print('');
    } else {
      print('List dalam kondisi kosong');
    }
  }

  Node? FindNode(int data) {
    Node? sekarang = head;
    int position = 1;

    while (sekarang != null) {
      if (sekarang.nodeValue == data) {
        print('data $data ditemukan pada posisi ke-$position');
        return sekarang;
      }
      sekarang = sekarang.next;
      position++;
    }

    print('data $data tidak ditemukan dalam list');
    return null;
  }
}

void main() {
  Linkedlist slist = Linkedlist();

  slist.insertFront(30);
  slist.insertFront(50);
  slist.insertFront(20);
  slist.printLinkedList();
  slist.FindNode(30);
  slist.FindNode(70);
}
