// menampung nilai didalam class untuk dipanggil di function main
class Tabung {
  // deklarasi variabel
  double jari_jari,tinggi;
  // variabel pi yg tidak bisa diubah
  final pi = 3.14 ;

  // menampung nilai di function
  Tabung (this.jari_jari, this.tinggi);
  
  // deklarasi function unruk rumus tabung
  double volume (){
    return pi*jari_jari*tinggi;
  }
}

// function main
void main(){
  // memanggil nilai didalam class 
   Tabung tabung = Tabung(10 , 15);

  // menghitung nilai class didalam function main
   double volume = tabung.volume();
  
  // menampilkan hasil 
   print("Hasil Volume Tabung $volume");

}

// referensi 
// https://dart.dev/guides/language/language-tour
// gemini