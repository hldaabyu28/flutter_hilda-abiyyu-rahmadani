Future<int> factorial(int n) async {
  // Hitung faktorial 
  if (n == 0) {
    return 1;
  } else {
    return n * await factorial(n - 1);
  }
}

void main() async {
  // Bilangan ingin dihitung faktorialnya
  int n = 5;

  // Menjalankan perhitungan faktorial secara asinkron
  int hasil = await factorial(n);

  // Cetak hasil
  print("Faktorial $n adalah $hasil");
}
