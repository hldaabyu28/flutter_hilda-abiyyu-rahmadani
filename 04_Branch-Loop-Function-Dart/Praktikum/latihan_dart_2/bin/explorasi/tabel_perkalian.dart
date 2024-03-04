import 'dart:io';

// function dan deklarasi variabel dan inisiasi nilai 
void tabelPerkalian(int n) {

  print('Tabel Perkalian $n x $n :\n');
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      stdout.write('${i * j}\t');
    }
    print('\n');
  }
}

// function main 
void main() {
  int nilai = 9 ;
  // mencetak hasil dengan cek menggunkan try catch
  try {
    tabelPerkalian(nilai);
  } catch (e) {
    print('Masukkan harus berupa bilangan bulat.');
  }
}
