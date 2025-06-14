import 'dart:io';

class Dnode<T> {
  T nodeValue;
  Dnode<T>? prev;
  Dnode<T>? next;
  Dnode(this.nodeValue)
      : next = null,
        prev = null;
}

class DoubleLinkedList<T> {
  Dnode<T>? head, tail;
  bool isEmpty() => head == null;

  // Menambahkan node di akhir (append)
  void append(T data) {
    Dnode<T> newNode = Dnode<T>(data);
    if (isEmpty()) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  void printlist(Dnode<T>? node) {
    Dnode<T>? tail;
    tail = null;
    print("traversal in forward direction: ");
    while (node != null) {
      stdout.write('${node.nodeValue} ');
      tail = node;
      node = node.next;
    }
    // print("");
    // print("traversal in reverse direction: ");
    // while (tail != null) {
    //   stdout.write("${tail.nodeValue} ");
    //   tail = tail.prev;
    // }
  }

  // Menambah node sebelum head
  void insertBeforeHead(dynamic data) {
    Dnode<T> newNode = Dnode<T>(data);
    if (isEmpty()) {
      append(data);
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  //menambah data baru atau di akhir node
  void InsertTailNode(dynamic data) {
    Dnode newnode = Dnode(data);
    if (isEmpty()) {
      append(data);
    } else {
      Dnode? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newnode;
      newnode.prev = temp;
    }
  }

  void deleteFront() {
    if (!isEmpty()) {
      if (head!.next != null) {
        Dnode? delete = head;
        head = head!.next;
        head!.prev = null;
        delete!.next = null;
      } else {
        head = null;
      }
    }
  }

  // Hapus node paling belakang
  void deleteEnd() {
    Dnode? temp;
    if (!isEmpty()) {
      if (head!.next != null) {
        temp = head;
        while (temp!.next!.next != null) {
          temp = temp.next;
        }
        temp.next!.prev = null;
        temp.next = null;
      } else {
        head = tail = null;
      }
    }
  }

  void tambahNode_sebelumByValue(T newData, T targetData) {
    Dnode<T>? current = head;
    while (current != null) {
      if (current.nodeValue == targetData) {
        Dnode<T> newNode = Dnode<T>(newData);
        newNode.next = current;
        newNode.prev = current.prev;

        if (current.prev != null) {
          current.prev!.next = newNode;
        } else {
          head = newNode;
        }
        current.prev = newNode;
        return;
      }
      current = current.next;
    }
    print("Node dengan data $targetData tidak ditemukan.");
  }
}

void main() {
  DoubleLinkedList list = DoubleLinkedList();
  print('sebelum');
  list.insertBeforeHead(10);
  list.insertBeforeHead(20);
  list.insertBeforeHead(30);
  list.insertBeforeHead(40);
  list.printlist(list.head);

  print('\nsesudah');
  list.tambahNode_sebelumByValue(25, 20);
  list.printlist(list.head);
}
