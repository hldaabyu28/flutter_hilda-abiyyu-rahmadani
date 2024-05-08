# Summary


##### 1. UI testing merupakan pengujian yang dilakukan pada tampilan suatu aplikasi dapat menerima interaksi san memberi respon  kepada pengguna 

##### 2. melakukan UI testing pada umumnya sudah terinstal pada sejak awal aplikasi dijalankan 

```dart

void main() {
  testWidgets('halaman harus menampilkan text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      )
    );
    
    expect(find.text('Create New Contact'), findsOneWidget);
  });
}

// kemudian di terminal jalankan flutter test 

```

##### 3. Build output 
###### mengubah nama aplikasi 
```dart

// buka ui_test\android\app\src\main\AndroidManifest.xml
android:label="ui_test" //ganti nama
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">

```

###### menambah logo aplikasi 

```dart
// generate icon yang akan ditambahkan generate app launcher untuk andoid / ios.


// directory launcher untuk android berada pada folder <nama_projek>/android/app/src/main/res
// Copy masing-masing asset pada directory app launcher masing-masing(folder android untuk android dan folder Assets.xcassets untuk Ios)


```