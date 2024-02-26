// function main 
void main() {
  // deklrasi variabel dan nilai
  String variabel = "mobil balap";

  // deklarasi variabel dan isi variabel kosong
  String Terbalik = "";

  // perulangan mengecek palindrom dan variabel akan dibalikkan 
  for (var i = variabel.length - 1; i >= 0; i--) {
    Terbalik += variabel[i];
  }

  // Mengecek apakah variabel sama dengan variabel terbalik
  if (variabel == Terbalik) {
    print("$variabel adalah palindrom");
  } else {
    print("$variabel bukan palindrom");
  }
}


// referensi 
// https://dart.dev/guides/language/language-tour
// gemini