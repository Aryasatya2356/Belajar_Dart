class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  //contsructor
  Mahasiswa(this.nrp, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    return nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    return 'Mahasiswa{nrp: $nrp, nama:$nama}';
  }
}

class Latihan {
  static void bubbleSort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (arr[j].compareTo(arr[j + 1]) > 0) {
          // Swap arr[j] and arr[j+1]
          T temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
  }

  static void display<T>(List<T> data) {
    for (var item in data) {
      print(item);
    }
  }

  static void main() {
    List<Mahasiswa> arr8 = [
      Mahasiswa("10", "Budi"),
      Mahasiswa("25", "Andi"),
      Mahasiswa("06", "Udin"),
      Mahasiswa("07", "Candra")
    ];

    print('Data Sebelum Pengurutan:');
    display(arr8);
    DateTime start = DateTime.now();
    bubbleSort(arr8);
    Duration elapsedTime = DateTime.now().difference(start);
    print('Data Setelah Pengurutan:');
    display(arr8);
    print('Waktu: ${elapsedTime.inMilliseconds} ms');
  }
}

void main() {
  Latihan.main();
}
