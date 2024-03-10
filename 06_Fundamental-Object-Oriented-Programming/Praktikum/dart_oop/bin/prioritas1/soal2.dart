//class mobil
class Mobil {
  double kapasitasMaksimum;
  // menampung nilai muatan 
  List<Map<String, dynamic>> muatan = [];

  Mobil(this.kapasitasMaksimum);

  //method menambahkan muatan 
  void tambahMuatan(String namaHewan, double berat) {
    if (sisaKapasitas() >= berat) {
      muatan.add({'nama': namaHewan, 'berat': berat});
      print('Muatan berhasil ditambahkan: $namaHewan, Berat: $berat kg');
    } else {
      print('Kapasitas tidak mencukupi untuk menambahkan muatan.');
    }
  }
  

  // memanggil total muatan   
  double totalMuatan() {
    double total = 0;
    for (var item in muatan) {
      total += item['berat'];
    }
    return total;
  }


  //menghitung maximal kapasitas dan total muatan 
  double sisaKapasitas() {
    return kapasitasMaksimum - totalMuatan();
  }
}

void main() {
  Mobil mobil = Mobil(100.0);

  // Menambahkan muatan
  mobil.tambahMuatan('Sapi', 50.0);
  mobil.tambahMuatan('Kambing', 30.0);
  mobil.tambahMuatan('Ayam', 20.0);
}
