
// deklarasi class untuk dipanggil didalam function main
class Lingkaran {
  // deklarasi variabel nilai jari-jari di class
  double jariJari;

  // nilai final pi tidak dapat diubah
  final pi = 22/7;

  // deklarsi class dan variabel untuk dipanggil di function
  Lingkaran(this.jariJari);

  // rumus hitung keliling didalam class 
  double hitungKeliling() {
    return 2 * pi * jariJari;
  }
  //rumus hitung luas di dalam class 
  double hitungLuas() {
    return pi* jariJari;
  }
}

void main() {
  // Membuat objek lingkaran dan memasukkan nilai dari variabel yang sudah dideklarasi didadalam class
  Lingkaran lingkaran = Lingkaran(49);

  // Menghitung keliling dan luas lingkaran
  double keliling = lingkaran.hitungKeliling();
  double luas = lingkaran.hitungLuas();

  // Menampilkan hasil
  print("Keliling lingkaran dengan jari-jari ${lingkaran.jariJari} adalah $keliling");
  print("Luas lingkaran dengan jari-jari ${lingkaran.jariJari} adalah $luas");
}

// referensi 
// https://dart.dev/guides/language/language-tour
// gemini