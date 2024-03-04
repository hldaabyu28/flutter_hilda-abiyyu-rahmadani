// future asynMap dan juga deklarasi dari variabel didalam function

Future<List<int>> asyncMap(List<int> data, int pengali) async {
  // deklarasi list dan variabel hasil untuk menampung nilai 
  List<int> hasil = [];

  // melakukan perulangan secara asynchronous
  for (int i = 0; i < data.length; i++) {
    // deklarasi hasil perulangan dan mencari nilai dari hasil perulangan 
    int hasilPerulangan = data[i] * pengali;

    // menambahkan hasil ke hasil perulangan
    hasil.add(hasilPerulangan);

    // await untuk menunggu hasil 
    await Future.delayed(Duration(seconds: 1));
  }

  // kembalikan list ke baru
  return hasil;
}


// function main
void main() async {
  // List data dan juga memasukkan nilai
  List<int> data = [1, 2, 3, 4, 5];

  // memasukkan nilai pengali
  int pengali = 2;

  // Menjalankan fungsi asyncMap
  List<int> hasil = await asyncMap(data, pengali);

  // Cetak hasil
  print(hasil);
}
