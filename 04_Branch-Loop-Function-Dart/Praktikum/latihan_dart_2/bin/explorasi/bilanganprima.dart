// function prima
bool prima(int number) {
  if (number <= 1) {
    return false;
  }

  // perulangan 
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

// function main
void main() {
  int bilangan = 2; // bilangan yang ingin di cek 

  //percabangan 
  if (prima(bilangan)) {
    print('$bilangan adalah bilangan prima');
  } else {
    print('$bilangan bukan bilangan prima');
  }
}