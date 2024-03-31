# Summary Advance user Input 

##### 1. Date Picker widget yang digunakan untuk memasukan tanggal
###### Cara menggunakan Datepicker dengan menggunaka fungsi showDatePicker yang merupakan bawaan dari flutter dan juga menambahkan package ``intl``
```dart
// mengimport package intl
import 'package:intl/intl.dart';

// mempersiapkan variabel 
DateTime _dueDate = DateTime.now();
final currentDate = DateTime.now();

// membuat date picker 
Widget buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Birth Date'),
            TextButton(
              onPressed: ()async{
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if(selectDate != null){
                    _dueDate = selectDate;
                  }
                
                });
              },
              child: const Text('Select'),
            )
          ]),
          Text(
            DateFormat('dd/MM/yyyy').format(_dueDate),
          ),
        ],
      ),
    );
  }

```
##### 2. Color picker widget untuk user bisa memilih color 
###### cara membuat color picker dengan menambahkan package ``flutter_collorpicker``
Cara membuat color picker 

```dart
// mengimport package 
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// membuat variabel
  Color _currentColor = Colors.orange; 

// membuat tampilan
 Widget buildColorPicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Color'),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 90,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick Your color'),
                    content: ColorPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currentColor),
            ),
            child: const Text('Pick Color'),
          ),
        )
      ]),
    );
  } 

```

##### 3. File picker digunakan untuk mengakses file pada storage 
###### cara membuat file picker dengan menambahkan package ``file_picker`` dan ``open_file``

```dart
//jangan lupa untuk menginport file_picker dan open_file
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

// membuat tampilan 
Widget buildFilePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pick Files'),
          const SizedBox(height: 10),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    _pickFile();
                  },
                  child: const Text('Pick and openFile'))),
        ],
      ),
    );
  }

//membuat fugsi 
 void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) return;
    
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

```
