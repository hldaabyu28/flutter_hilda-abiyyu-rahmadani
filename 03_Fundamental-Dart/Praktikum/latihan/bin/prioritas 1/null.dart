
// function main
 void main () {
  // deklarasi variabel tidak bernilai null
  String nama = "dani"  ;
  // deklarasi variabel bernilai null
  String? kota ;


  
  // ouput untuk membuktikan
  print(nama);
  print(kota ?? "Tulungagung");

  // seleksi jika variabel bernilai null atau pun tidak
  if (kota == null){
    print("variabel null");
  }else {
    print("variabel tidak null");
  }

  if (nama == null){
    print("Variabel null");
  }else {
    print("variabel tidak null");
  }

}

// referensi 
// https://dart.dev/guides/language/language-tour
// gemini