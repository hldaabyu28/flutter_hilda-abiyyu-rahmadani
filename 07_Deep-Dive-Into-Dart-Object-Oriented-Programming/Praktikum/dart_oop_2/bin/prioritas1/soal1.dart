// Class BangunRuang
class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

// Class Kubus extends BangunRuang
class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    print('Menghitung volume kubus.');
    return sisi * sisi * sisi;
  }
}

// Class Balok extends BangunRuang
class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi) : super(panjang, lebar, tinggi);

  @override
  double volume() {
    print('Menghitung volume balok.');
    return panjang * lebar * tinggi;
  }
}

void main() {
  BangunRuang kubus = Kubus(5.0);
  print('Volume kubus: ${kubus.volume()}');

  BangunRuang balok = Balok(3.0, 4.0, 5.0);
  print('Volume balok: ${balok.volume()}');
}
