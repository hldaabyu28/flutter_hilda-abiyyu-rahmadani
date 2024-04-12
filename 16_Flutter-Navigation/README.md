# Summary

##### 1. Navigation merupakan cara agar berpindah halaman dari satu halaman lain 

##### 2. Navigation dasar dengan menggunakan
##### ``Navigator.push()`` untuk berpindah halaman
##### ``Navigator.pop()`` untuk kembali halaman sebelumnya 
 
```dart
//navigator push
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ContactPage()),
);

//navigator pop
Navigator.pop(context);

```

##### 3. Navigation dengan named routes tiap halaman memiliki alamat disebut route  
```dart
// tambahkan intialroute dan routes di materialapp
initialRoute: '/',
  routes: {
    '/': (context) => const FirstScreen(),
    '/second': (context) => const SecondScreen(),
  },

// menggunakan named route 

Navigator.pushNamed(context, '/second');
```