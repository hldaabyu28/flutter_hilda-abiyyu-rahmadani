List<String> removeDuplicates(List<String> dataList) {
  Set<String> uniqueData = dataList.toSet(); //menghapus duplikasi mengggunakan toset 
  return uniqueData.toList(); //mengkonversi kemabali menggunkan to list
}

void main() {
  List<String> input1 = ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS'];
  List<String> input2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];

  
  List<String> output1 = removeDuplicates(input1);
  print('Sampel Output 1: $output1');

  List<String> output2 = removeDuplicates(input2);
  print('Sampel Output 2: $output2');
}
