// function main 
void main(){
  // tipe list dan data string variabel dan inisiasi nilai 
  List<String> buah = ['Apple', 
                      'Banana', 
                      'Avocado', 
                      'Cherry', 
                      'Mango', 
                      'Apricot', 
                      'Blueberry', 
                      'Acerola', 
                      'Grape',
                      'Almond'];
    // perulangan memanggil buah 
   for (var buah in buah) {
    // mencari nilai buah yang berawalan A dengan pengambilan keputusan 
    if (buah.startsWith('A')) {
      // hasil ouput nilai buah berawalan A
      print(buah);
    }
  }
}