import 'dart:io';

void main() {
  // deklarasi variabel dan inisiasi nilai
  int tinggi = 9 ;

  // Membuat bagian atas jam pasir
  for (int i = 0; i < tinggi ~/ 2 + 1; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write(' ');
    }
    for (int k = 0; k < tinggi - 2 * i; k++) {
      stdout.write('0');
    }
    stdout.write('\n');
  }

  // Membuat bagian bawah jam pasir
  for (int i = tinggi ~/ 2; i > 0; i--) {
    for (int j = 0; j < i - 1; j++) {
      stdout.write(' ');
    }
    for (int k = 0; k < tinggi - 2 * i + 2; k++) {
      stdout.write('0');
    }
    stdout.write('\n');
  }
}
