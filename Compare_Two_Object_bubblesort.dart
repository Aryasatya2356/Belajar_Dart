class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;
//contsructor
  Mahasiswa(this.nrp, this.nama);
  int compareTo(Mahasiswa other) {
    return this.nrp.compareTo(other.nrp);
  }

  String toString() {
    return 'Mahasiswa{nrp: $nrp, nama:$nama}';
  }
}

void main() {
  var mahasiswa1 = Mahasiswa('25', 'Bahrul');
  var mahasiswa2 = Mahasiswa('20', 'Adi');
  print(mahasiswa1.compareTo(mahasiswa2));
  print(mahasiswa1);
  print(mahasiswa2);
}
