
void main() {
  // Membuat list dengan dynamic
  List<List<dynamic>> Biodata = [
    ['Nama', 'Hilda'],
    ['Umur', 20 ],
    ['Alamat', 'Malang'],
    ['Tinggi', 169]
  ];

  // Membuat map menggunakan list tersebut
  Map<String, dynamic> dataMap = {};

  // perulangan dengan memanggil list satu-satu lalu dimasukkan ke map
  for (var data in Biodata) {
    dataMap[data[0]] = data[1];
  }

  // Menampilkan map yang dihasilkan
  print(dataMap);
}
