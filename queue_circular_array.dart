class CircularQueue {
  List<int> element;
  int front;
  int rear;
  int maxQueue;

  CircularQueue(int size)
      : element = List.filled(size, 0),
        front = 0,
        rear = 0,
        maxQueue = size - 1;

  bool isFull() {
    bool flag = true;
    for (int i = 0; i <= maxQueue; i++) {
      if (element[i] == 0) {
        flag = false;
        break;
      }
    }
    return flag;
  }

  bool isEmpty() {
    bool flag = true;
    for (int i = 0; i <= maxQueue; i++) {
      if (element[i] != 0) {
        flag = false;
        break;
      }
    }
    return flag;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      if (rear != maxQueue) {
        rear += 1;
      } else {
        rear = 0;
      }
      element[rear] = data;
    }
  }

  int dequeue() {
    int data = 0;
    if (isEmpty()) {
      print("Queue Underflow");
    } else {
      if (front != maxQueue) {
        front += 1;
      } else {
        front = 0;
      }
      data = element[front];
      element[front] = 0;
    }
    return data;
  }

  void display() {
    print("Isi Queue:");
    for (int i = 0; i <= maxQueue; i++) {
      print('Index $i: ${element[i]}');
    }
  }
}

void main() {
  CircularQueue queue = CircularQueue(5); // Kapasitas queue 5 elemen

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);

  queue.display();

  print("\nMengambil data: ${queue.dequeue()}");
  print("\nMengambil data: ${queue.dequeue()}");

  queue.display();

  queue.enqueue(50);
  queue.enqueue(60);

  queue.display();
}
