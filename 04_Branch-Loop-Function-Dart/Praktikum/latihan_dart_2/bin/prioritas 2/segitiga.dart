import 'dart:io';

void main() {
  // deklarasi variabel dan inisiasi nilai
  int tinggi = 10 ;

  int alas = 15 ;

  // Membuat segitiga bintang
  for (int i = 0; i < tinggi; i++) {
    for (int j = 0; j < alas - i; j++) {
      stdout.write(' ');
    }
    for (int k = 0; k < 2 * i + 1; k++) {
      stdout.write('*');
    }
    stdout.write('\n');
  }
}
