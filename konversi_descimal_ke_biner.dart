import 'dart:io';

class Konversi {
  void konversikeDesimal(int desimal) {
    String biner = desimal.toRadixString(2);
    String oktal = desimal.toRadixString(8);
    String heksa = desimal.toRadixString(16);

    print('hasil konversi ke biner : $biner');
    print('hasil konversi ke oktal : $oktal');
    print('hasil konversi ke heksa : $heksa');
  }

  void cekPalindrom(String kalimat) {
    String pembalikan = kalimat.split('').reversed.join('');
    print('hasil = $pembalikan');

    if (kalimat == pembalikan) {
      print('palindrom');
    } else {
      print('bukan palindrom');
    }
  }
}

void main() {
  var k = Konversi();

  while (true) {
    print('Pilih opsi yang diinginkan');
    print('1. konversi desimal ke biner, oktal dan heksa');
    print('2. cek kata/kalimat palindrom');
    print('3. keluar');
    stdout.write('Masukkan Pilihan (1/2/3): ');
    String dipilih = stdin.readLineSync()!;
    if (dipilih == '1') {
      print('masukkan nilai desimal: ');
      int desimal = int.parse(stdin.readLineSync()!);
      k.konversikeDesimal(desimal);
    } else if (dipilih == '2') {
      print('Masukkan kalimat: ');
      String kalimat = stdin.readLineSync()!;
      k.cekPalindrom(kalimat);
    } else if (dipilih == '3') {
      print('terimakasih');
      break;
    } else {
      print('Pilihan tidak tersedia, mohon pilih 1 atau 2');
    }
  }
}
