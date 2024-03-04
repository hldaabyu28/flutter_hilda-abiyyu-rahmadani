import 'dart:math';

// function yang akan dipanggil di main 
double hitungLuasLingkaran(double jariJari) {
  return pi * jariJari * jariJari;
}

// function main
void main() { 
  double jariJari = 70;
  double luas = hitungLuasLingkaran(jariJari);
  print('Luas lingkaran dengan jari-jari $jariJari adalah $luas');
}
