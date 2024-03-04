// function main
void main() {
  // List nilai
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  // Hitung total nilai dengan menggabungakn list menggunakan reduce
  int total = nilai.reduce((a, b) => a + b);

  // Hitung rata-rata
  double rataRata = total / nilai.length;

  // Bulatkan rata-rata ke atas menggunkan ceil
  int hasilAkhir = rataRata.ceil();

  // Cetak hasil
  print("Rata-rata: $hasilAkhir");
}
