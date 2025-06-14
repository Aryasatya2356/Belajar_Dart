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
