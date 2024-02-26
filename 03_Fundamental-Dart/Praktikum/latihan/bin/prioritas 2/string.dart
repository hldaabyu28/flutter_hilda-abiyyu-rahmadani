// menampung nilai di dalam class
class Biodata {
  // deklarasi variabel 
  String nama,alamat,prodi ;

  // untuk menampung nilai di dalam function
  Biodata (this.nama, this.alamat, this.prodi);
} 

// function main
void main(){

  // memanggil objek nilai didalam class dan juga menambahkan isian 
  Biodata biodata = Biodata('Hilda', 'Tulungagung' , 'Teknologi Informasi');

  // menampilkan hasil dan menggabungkan nilai yang sudah dipanggil 
  print('Perkenalkan Nama Saya ${biodata.nama} Saya Berasal dari ${biodata.alamat} Berkuliah di jurusan ${biodata.prodi}');
}

// referensi 
// https://dart.dev/guides/language/language-tour
// gemini