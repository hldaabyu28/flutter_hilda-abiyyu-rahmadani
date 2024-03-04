// function dan deklarasi data 

void countDataTypes(List<dynamic> data) {
  // Variabel 
  int countString = 0;
  int countBool = 0;
  int countInt = 0;
  int countDouble = 0;

  // perulangan 
  for (var element in data) {
    // Memeriksa tipe data dan increment counter yang sesuai
    if (element is String) {
      countString++;
    } else if (element is bool) {
      countBool++;
    } else if (element is int) {
      countInt++;
    } else if (element is double) {
      countDouble++;
    }
  }

  // Cetak jumlah kemunculan untuk setiap tipe data
  print("Jumlah String: $countString");
  print("Jumlah Bool: $countBool");
  print("Jumlah Int: $countInt");
  print("Jumlah Double: $countDouble");
}


void main() {
  // List data dengan tipe data dinamis
  List<dynamic> data = ["Hello",16 ,'p',true, 10, 3.14, 7.9];

  // Menjalankan 
  countDataTypes(data);
}
