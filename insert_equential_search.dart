int sequentialSearch(List<int> data, int kunci) {
  for (int i = 0; i < data.length; i++) {
    if (data[i] == kunci) return i;
  }
  return -1; // kunci tidak ditemukan
}

void sisipSebelum(List<int> data, int kunci, int nilaiBaru) {
  int index = sequentialSearch(data, kunci);
  if (index != -1) {
    data.insert(index, nilaiBaru);
  } else {
    print("Kunci $kunci tidak ditemukan untuk sisip sebelum.");
  }
}

void sisipSesudah(List<int> data, int kunci, int nilaiBaru) {
  int index = sequentialSearch(data, kunci);
  if (index != -1) {
    data.insert(index + 1, nilaiBaru);
  } else {
    print("Kunci $kunci tidak ditemukan untuk sisip sesudah.");
  }
}

void hapusKunci(List<int> data, int kunci) {
  int index = sequentialSearch(data, kunci);
  if (index != -1) {
    data.removeAt(index);
  } else {
    print("Kunci $kunci tidak ditemukan untuk dihapus.");
  }
}

void main() {
  List<int> data = [10, 20, 30, 40, 50];
  print("Data awal: $data");

  sisipSebelum(data, 30, 25);
  print("Setelah sisip sebelum 30: $data");

  sisipSesudah(data, 30, 35);
  print("Setelah sisip sesudah 30: $data");

  hapusKunci(data, 40);
  print("Setelah hapus 40: $data");
}
