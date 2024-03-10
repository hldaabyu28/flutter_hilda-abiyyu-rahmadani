import 'dart:io';

void tampilkanNilai(double nilai) {
  // switch case dengan mencari inputan nilai dan hasil yang akan di print  
 
  switch (nilai){
    case > 70 :
    print("Nilai A");
    break;
    case > 40 :
    print("Nilai B");
    break;
    case > 0 :
    print("Nilai C");
    break;
    default:
    print("Nilai tidak ada");

  }
}

void main() {
  // Memanggil fungsi yang menggunakan switch case dan menambahkan nilai
  tampilkanNilai(90.0);
}
