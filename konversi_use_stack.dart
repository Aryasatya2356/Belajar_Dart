class Stack {
  List<String> _items = [];

  // Menambahkan item ke dalam stack
  void push(String item) {
    _items.add(item);
  }

  // Mengambil item terakhir dari stack
  String pop() {
    if (isEmpty()) {
      throw Exception('Stack is empty');
    }
    return _items.removeLast();
  }

  // Mendapatkan item terakhir tanpa menghapusnya
  String top() {
    if (isEmpty()) {
      throw Exception('Stack is empty');
    }
    return _items.last;
  }

  // Mengecek apakah stack kosong
  bool isEmpty() {
    return _items.isEmpty;
  }
}

class KonversiDenganStack {
  // Fungsi konversi desimal ke biner, oktal, dan heksadesimal menggunakan stack
  void konversiDesimal(int desimal) {
    Stack stack = Stack();

    // Konversi ke biner
    int temp = desimal;
    while (temp > 0) {
      stack.push((temp % 2).toString());
      temp ~/= 2;
    }

    String biner = '';
    while (!stack.isEmpty()) {
      biner += stack.pop();
    }
    print('Hasil nilai biner = $biner');

    // Konversi ke oktal
    temp = desimal;
    stack = Stack(); // Reset stack untuk oktal
    while (temp > 0) {
      stack.push((temp % 8).toString());
      temp ~/= 8;
    }

    String oktal = '';
    while (!stack.isEmpty()) {
      oktal += stack.pop();
    }
    print('Hasil nilai oktal = $oktal');

    // Konversi ke heksadesimal
    temp = desimal;
    stack = Stack(); // Reset stack untuk heksadesimal
    const hexChars = '0123456789ABCDEF';
    while (temp > 0) {
      stack.push(hexChars[temp % 16]);
      temp ~/= 16;
    }
    String heksa = '';
    while (!stack.isEmpty()) {
      heksa += stack.pop();
    }
    print('Hasil nilai heksadesimal = $heksa');
  }

  // Fungsi untuk membalik kalimat dan cek palindrom dengan stack
  void cekPalindrom(String kalimat) {
    Stack stack = Stack();

    // Menambahkan karakter ke stack
    for (var ch in kalimat.split('')) {
      stack.push(ch);
    }

    String reversed = '';
    while (!stack.isEmpty()) {
      reversed += stack.pop();
    }

    print('Hasil = $reversed');
    if (kalimat == reversed) {
      print('Palindrom');
    } else {
      print('Bukan palindrom');
    }
  }
}
