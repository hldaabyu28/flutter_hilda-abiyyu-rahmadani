// function main 
void main() {
  // Deklarasi Variabel dan juga nilai 
  int bilangan = 24;

  // output dan memanggil nilai
  print("Faktor dari $bilangan: ");
  
  // perulangan untuk mencari nilai faktor dan mencetak nya  
  for (var i = 1; i < bilangan; i++) {
    // jika bilangan dibagi dengan i sama dengan 0 maka print faktor
    if (bilangan % i == 0) {
      print(i);
    }
  }
}


// referensi 
// https://dart.dev/guides/language/language-tour
// gemini