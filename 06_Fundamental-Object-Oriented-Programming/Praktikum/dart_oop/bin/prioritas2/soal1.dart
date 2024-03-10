class Calculator {
  // Method untuk melakukan penjumlahan dua bilangan
  double add(double num1, double num2) {
    return num1 + num2;
  }

  // Method untuk melakukan pengurangan dua bilangan
  double subtract(double num1, double num2) {
    return num1 - num2;
  }

  // Method untuk melakukan perkalian dua bilangan
  double multiply(double num1, double num2) {
    return num1 * num2;
  }

  // Method untuk melakukan pembagian dua bilangan
  double divide(double num1, double num2) {
    if (num2 == 0) {
      throw ArgumentError('Nilai tidak boleh 0');
    }
    return num1 / num2;
  }
}

void main() {
  // membuat objek
  Calculator calculator = Calculator();

  // Contoh penggunaan method-method dalam class Calculator
  double num1 = 10;
  double num2 = 5;

  print('Penjumlahan: ${calculator.add(num1, num2)}');
  print('Pengurangan: ${calculator.subtract(num1, num2)}');
  print('Perkalian: ${calculator.multiply(num1, num2)}');
  print('Pembagian: ${calculator.divide(num1, num2)}');
}
