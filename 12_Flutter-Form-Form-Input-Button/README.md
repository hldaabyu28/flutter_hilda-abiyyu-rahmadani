# Summary Flutter Form

## 1. Form 
##### - menerima isian dari pengguna dan dapat lebih dari satu 
###### Form disimpan menggunakan GlobalKey<FormState> dan menggunakan Stateful Widget

Penggunaan Form 
```dart
var formKey = GlobalKey<FormState>();

Form(
    key: formKey,
    child: inputWidgtes
);
```
## 2. Input 
##### - Text Field isian data dari pengguna data dapat lebih dari satu
###### membuat textfield menggunakan text editing controller isian data berupa teks

Penggunaan Textield
```dart
var inputController = TextEditingController();
TextField(
    controller : inputController,
)
```
##### - Radio memberi opsi hanya dapat memilih 1 opsi berbeda dengan checkbox
###### Data diambil menggunakan property dengan tipe data sesuai pada radio

```dart
var radioValue='';

Radio<String>(
    value: 'Laki-Laki',
    groupValue: radioValue,
    onChanged: (String? value){
        setState((){
            radioValue = value ?? '';
        })
    }
)
```

##### - checkbox memberi opsi pada pengguna Dapat memilih beberapa opsi
###### data diambil menggunakan property bool 

```dart
var checkValue=false;

            ListTile(
              leading: Checkbox(
                value: checkValue,
                onChanged: (bool ? value){
                  setState(() {
                    checkValue = value ?? false;
                  },
                  );
                },
              ),
              title: const Text('Checkbox'),
            ),
```

##### - Dropdown button memberi opsi pada pengguna hanya bisa memilih satu opsi , opsi ditampilkan hanya jika ditekan 
###### data diambil menggunakan property dengan tipe data sesuasi value pada dropdownmenu item

```dart
var dropDownValue = 0 ;
            DropdownButton(
              value: dropDownValue, 
              onChanged: (int ? value){
                setState(() {
                  dropDownValue = value ?? 0;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 0, child: Text('Pilih..'),
                ),
                 DropdownMenuItem(
                  value: 1, child: Text('Satu'),
                ),
                 DropdownMenuItem(
                  value: 2, child: Text('Dua'),
                ),
                 DropdownMenuItem(
                  value: 3, child: Text('Tiga'),
                )
    ]),
```
## 2. Button seperti tombol jika ditekan akan melakukan sesuatu

###### - ElevatedButton tombol yang timbul jika ditekan akan menjalankan onPressed

```dart

ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white
    ),
    onPressed: () {} , 
    child: const Text('Submit'),
),
```
###### - IconButton tombol yang menampilkan icon jika ditekan akan menjalankan onPressed
```dart
  IconButton(
    onPressed: (){}, 
    icon: const Icon(Icons.add),
    ),
```