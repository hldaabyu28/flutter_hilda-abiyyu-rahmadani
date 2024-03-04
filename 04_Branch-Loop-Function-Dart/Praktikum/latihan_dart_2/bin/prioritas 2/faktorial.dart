// function dan deklarasi variabel 
BigInt faktorial(int n) {
  if (n == 0 || n == 1) {
    return BigInt.one;
  } else {
    return BigInt.from(n) * faktorial(n - 1);
  }
}

// function main 
void main() {
  // list nilai 
  List<int> values = [10, 40, 50];
  // foreach untul mencetak dari list 
  values.forEach((value) {
    print('Faktorial dari $value adalah: ${faktorial(value)}');
  });
}

