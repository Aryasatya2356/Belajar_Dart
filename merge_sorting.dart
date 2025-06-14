class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;
  Mahasiswa(this.nrp, this.nama);
  @override
  int compareTo(Mahasiswa other) {
    return this.nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    return 'Mahasiswa{nrp: $nrp, nama: $nama}';
  }
}

class Latihan {
  static void merge<T extends Comparable<T>>(List<T> arr, int l, int m, int r) {
    int n1 = m - l + 1;
    int n2 = r - m;
    List<T> L = List<T>.filled(n1, arr[l]);
    List<T> R = List<T>.filled(n2, arr[m + 1]);
    for (int i = 0; i < n1; i++) {
      L[i] = arr[l + i];
    }
    for (int j = 0; j < n2; j++) {
      R[j] = arr[m + 1 + j];
    }
    int i = 0, j = 0;
    int k = l;
    while (i < n1 && j < n2) {
      if (L[i].compareTo(R[j]) <= 0) {
        arr[k] = L[i];
        i++;
      } else {
        arr[k] = R[j];
        j++;
      }
      k++;
    }
    while (i < n1) {
      arr[k] = L[i];
      i++;
      k++;
    }
    while (j < n2) {
      arr[k] = R[j];
      j++;
      k++;
    }
  }

  static void mergeSort<T extends Comparable<T>>(List<T> arr, int l, int r) {
    if (l < r) {
      int m = l + (r - l) ~/ 2;
      mergeSort(arr, l, m);
      mergeSort(arr, m + 1, r);
      merge(arr, l, m, r);
    }
  }

  static void tampil<T>(List<T> data) {
    for (var item in data) {
      print(item);
    }
  }

  static void main() {
    List<Mahasiswa> arr8 = [
      Mahasiswa("02", "Budi"),
      Mahasiswa("01", "Andi"),
      Mahasiswa("04", "Udin"),
      Mahasiswa("03", "Candra")
    ];
    print('Data Sebelum Pengurutan:');
    tampil(arr8);
    DateTime startTime = DateTime.now();
    mergeSort(arr8, 0, arr8.length - 1);
    Duration elapsedTime = DateTime.now().difference(startTime);
    print('Data Setelah Pengurutan:');
    tampil(arr8);
    print('Waktu: ${elapsedTime.inMilliseconds} ms');
  }
}

void main() {
  Latihan.main();
}
