int linearSearch(List<int> arr, int target) {
  int comparisons = 0; // buat ngitung berapa kali dibandingkan
  for (int i = 0; i < arr.length; i++) {
    comparisons++; // setiap kita bandingkan data, tambah 1
    if (arr[i] == target) {
      print(
          "Linear Search: Ditemukan pada indeks $i setelah $comparisons perbandingan.");
      return i;
    }
  }
  print("Linear Search: Tidak ditemukan setelah $comparisons perbandingan.");
  return -1;
}

int binarySearch(List<int> arr, int target) {
  int comparisons = 0;
  int left = 0;
  int right = arr.length - 1;

  while (left <= right) {
    int mid = (left + right) ~/ 2; // cari tengah
    comparisons++;
    if (arr[mid] == target) {
      print(
          "Binary Search: Ditemukan pada indeks $mid setelah $comparisons perbandingan.");
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1; // cari di kanan
    } else {
      right = mid - 1; // cari di kiri
    }
  }

  print("Binary Search: Tidak ditemukan setelah $comparisons perbandingan.");
  return -1;
}

void main() {
  List<int> dataLinear = [5, 12, 8, 20, 30, 1]; // acak, bisa dipakai linear
  List<int> dataBinary = [1, 5, 8, 12, 20, 30]; // urut, cocok untuk binary
  int target = 20;

  print("=== Linear Search ===");
  linearSearch(dataLinear, target);

  print("\n=== Binary Search ===");
  binarySearch(dataBinary, target);
}
