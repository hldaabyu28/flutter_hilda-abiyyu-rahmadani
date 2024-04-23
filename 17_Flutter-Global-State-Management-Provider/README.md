# Summary

# Flutter State Management (Provider)

##### 1. State Management proses mengelola dan mempertahankan status (state) dari sebuah aplikasi Flutter. Ini mencakup bagaimana data diperoleh, disimpan, diperbarui, dan diakses dalam aplikasi. State management memungkinkan aplikasi untuk merespons terhadap perubahan data atau kejadian dengan memperbarui tampilan UI secara dinamis.

refrensi chatgpt


##### 2. Pengertian State merupakan data yang bisa dibaca saat kita membuat widget dan dapat berubah saat widget sedang aktif serta hanya dimiliki oleh `StatefullWidget`

```dart
//penggunaan state
class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (newIndex) {
        setState(() {
          _index = newIndex;
        });
      },
      // ... items ...
    );
  }
}
```

##### 3. GLobal State merupakan state yang dapat digunakan pada seluruh widget `Provider` : State Management dan perlu di install agar dapat digunakan 

penggunaan provider 

###### tambahkan provider di puspec.yaml

```dart
dependencies:
  flutter:
    sdk: flutter
  provider: ^5.0.0

```

###### membuat model untuk menyimpan data secara global

```dart
// user_model.dart
class UserModel {
  final String name;
  final int age;

  UserModel({required this.name, required this.age});
}
```
###### membuat class untuk mengelola state secara global menggunakan provider

```dart
// user_provider.dart
import 'package:flutter/material.dart';
import 'user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(name: 'John Doe', age: 30);

  UserModel get user => _user;

  void updateUser(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }
}
```

###### Di dalam widget tree utama, lakukan wrap dengan Provider dan gunakan Consumer untuk mengakses state global

```dart

// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
import 'user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Global State Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return Text(
                  'Name: ${userProvider.user.name}, Age: ${userProvider.user.age}',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                UserProvider userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                userProvider.updateUser(UserModel(name: 'Jane Doe', age: 25));
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}

```

refrensi chatgpt
