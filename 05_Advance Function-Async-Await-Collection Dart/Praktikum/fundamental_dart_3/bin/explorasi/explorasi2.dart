import 'dart:collection';

//function dengan map 
Map<String, int> hitungData(List<String> data) {
  Map<String, int> banyakData = {};
  for (String item in data) {
    
    banyakData[item] = banyakData.containsKey(item) ? banyakData[item]! + 1 : 1;
  }
  return banyakData;
}
void main() {
  // Sampel input
  List<String> data = ["js", "js", "js", "golang", "python", "js", "js", "golang", "rust"];

  // Menghitung data 
  Map<String, int> banyakData = hitungData(data);

  // Menampilkan hasil
  banyakData.forEach((key, value) {
    print("$key: $value");
  });
}

