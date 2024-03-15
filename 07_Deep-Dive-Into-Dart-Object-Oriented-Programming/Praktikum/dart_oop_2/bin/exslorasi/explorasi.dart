// Interface Persegi
abstract class Persegi {
  double hitungLuas(double sisi);
  double hitungKeliling(double sisi);
}

// Interface Segitiga
abstract class Segitiga {
  double hitungLuas(double alas, double tinggi);
  double hitungKeliling(double sisi1, double sisi2, double sisi3);
}

// Interface Lingkaran
abstract class Lingkaran {
  double hitungLuas(double jari);
  double hitungKeliling(double jari);
}

// Class BangunDatar
class BangunDatar {
  double getArea(Object obj) {
    if (obj is Persegi) {
      Persegi persegi = obj;
      return persegi.hitungLuas(9); 
    } else if (obj is Segitiga) {
      Segitiga segitiga = obj;
      return segitiga.hitungLuas(3, 4); 
    } else if (obj is Lingkaran) {
      Lingkaran lingkaran = obj;
      return lingkaran.hitungLuas(5); 
    } else {
      throw Exception("Objek tidak valid");
    }
  }

  double getPerimeter(Object obj) {
    if (obj is Persegi) {
      Persegi persegi = obj;
      return persegi.hitungKeliling(5); 
    } else if (obj is Segitiga) {
      Segitiga segitiga = obj;
      return segitiga.hitungKeliling(3, 4, 5); 
    } else if (obj is Lingkaran) {
      Lingkaran lingkaran = obj;
      return lingkaran.hitungKeliling(5); 
    } else {
      throw Exception("Objek tidak valid");
    }
  }
}

void main() {
  BangunDatar bangunDatar = BangunDatar();

  // Contoh penggunaan untuk Persegi
  double luasPersegi = bangunDatar.getArea(Square());
  double kelilingPersegi = bangunDatar.getPerimeter(Square());
  print('Luas Persegi: $luasPersegi');
  print('Keliling Persegi: $kelilingPersegi');

  // Contoh penggunaan untuk Segitiga
  double luasSegitiga = bangunDatar.getArea(Triangle());
  double kelilingSegitiga = bangunDatar.getPerimeter(Triangle());
  print('Luas Segitiga: $luasSegitiga');
  print('Keliling Segitiga: $kelilingSegitiga');

  // Contoh penggunaan untuk Lingkaran
  double luasLingkaran = bangunDatar.getArea(Circle());
  double kelilingLingkaran = bangunDatar.getPerimeter(Circle());
  print('Luas Lingkaran: $luasLingkaran');
  print('Keliling Lingkaran: $kelilingLingkaran');
}

// Implementasi Persegi
class Square implements Persegi {
  @override
  double hitungLuas(double sisi) {
    return sisi * sisi;
  }

  @override
  double hitungKeliling(double sisi) {
    return 4 * sisi;
  }
}

// Implementasi Segitiga
class Triangle implements Segitiga {
  @override
  double hitungLuas(double alas, double tinggi) {
    return 0.5 * alas * tinggi;
  }

  @override
  double hitungKeliling(double sisi1, double sisi2, double sisi3) {
    return sisi1 + sisi2 + sisi3;
  }
}

// Implementasi Lingkaran
class Circle implements Lingkaran {
  @override
  double hitungLuas(double jari) {
    return 3.14 * jari * jari;
  }

  @override
  double hitungKeliling(double jari) {
    return 2 * 3.14 * jari;
  }
}
