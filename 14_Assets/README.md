# Summary

##### 1. Assets merupkan kumpulan fie bundle yang didipeloyed bersamaan dengan aplikasi , tipe assets seperti images,data json, icons, vector, font(ttf)
###### cara menggunakan assets menambahkan lokasi directory assets kedalam pubspec.yaml 

```dart
assets :
  - assets/images/bg.jpg

```

##### 2. image berupa gambar yang digunakan untuk membuat tampilan lebih menarik dapat menyimpan format gambar berbentuk jpeg, webp,gif,animatedd Web/gif,png,bmp wbmp dan dapat juga menampilkan gambar dari internet 
###### beberapa cara penggunaan image
penggunaan dengan widget image membutuhkan properti image dan class AssetsImage()
```dart
    Image(image: AssetsImage('assets/image/bg.jpg'))
```
penggunaan dengan method Image.asset 
```dart
     Image.asset('assets/images/search.png' , width: 100 , height: 100 ),
```
penggunaan method Image.network dapat mengamil gambar dari internet
```dart
    Image.network('https://picsum.photos/200/300'),

```
##### 3. - Vector merupakan bentuk data yang bertipe svg membutuhkan package flutter_svg
###### menambahkan kelas SvgPicture dan ditambahkan method
```dart
    SvgPicture.network('https://www.svgrepo.com/show/104100/link.svg')
```

#####    - Font digunakan untuk membuat tampilan teks lebih manarik
Custom font font yang didownload dan di import kedalam folder 
```dart
//import font kedalam folder fonts
//daftarkan font ke pubspec.yaml
- family: Schyler
       fonts:
         - asset: fonts/Schyler-Regular.ttf
//menggunakan font 
Text('Detail Image', style: TextStyle(fontSize: 20,fontFamily: 'Schyler',)),

```
font dari package dengan menambahkan ke pubspec.yaml seperti menggunakan google_fonts 
```dart
// import google_fonts ke dependencies
dependencies:
  google_fonts: ^6.2.0

// menggunakan font
Text('Home',  style: GoogleFonts.plusJakartaSans(fontSize: 20,fontWeight: FontWeight.bold),),
```
