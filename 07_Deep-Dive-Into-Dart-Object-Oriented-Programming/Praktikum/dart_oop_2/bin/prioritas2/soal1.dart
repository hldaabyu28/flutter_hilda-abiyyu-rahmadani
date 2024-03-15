// Interface KelipatanPersekutuanTerkecil
abstract class KelipatanPersekutuanTerkecil {
  int cariKelipatanPersekutuanTerkecil(int x, int y);
}

// Interface KelipatanPersekutuanTerbesar
abstract class KelipatanPersekutuanTerbesar {
  int cariKelipatanPersekutuanTerbesar(int x, int y);
}

// Class Matematika
class Matematika implements KelipatanPersekutuanTerkecil, KelipatanPersekutuanTerbesar {
  @override
  int cariKelipatanPersekutuanTerkecil(int x, int y) {
    int result = 1;
    int greater = x > y ? x : y;
    while (true) {
      if (greater % x == 0 && greater % y == 0) {
        result = greater;
        break;
      }
      greater++;
    }
    return result;
  }

  @override
  int cariKelipatanPersekutuanTerbesar(int x, int y) {
    int result = 1;
    int smaller = x < y ? x : y;
    for (int i = smaller; i >= 1; i--) {
      if (x % i == 0 && y % i == 0) {
        result = i;
        break;
      }
    }
    return result;
  }
}

void main() {
  Matematika matematika = Matematika();

  int x = 12;
  int y = 18;

  int kpt = matematika.cariKelipatanPersekutuanTerkecil(x, y);
  int kpb = matematika.cariKelipatanPersekutuanTerbesar(x, y);

  print('Kelipatan Persekutuan Terkecil dari $x dan $y adalah: $kpt');
  print('Kelipatan Persekutuan Terbesar dari $x dan $y adalah: $kpb');
}
