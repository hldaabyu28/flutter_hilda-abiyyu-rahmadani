# Summary Flutter Storage 


##### 1. penyimpanan lokal diperlukan untuk efisiensi penggunaan data internet beberapa penerapan penyimpanan lokal menggunakan shared preference dan local database 

##### 2. Shared preference penyimpanan data yang sederhana dengan format key-value , menyimpan tipe seperti teks,angka, dan bolean, contoh penggunaan seperti menyimpan data login dan riwayat pencarian 

menggunakan shared preference

```dart
// tambahkan ke dependencies
dependencies:
  shared_preferences: ^2.2.3

// buat folder dan folder untuk menampun shared preference 

class UserPreferences {

    Future<void> storeLoginState(bool isLogin, UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', isLogin);
    await prefs.setString('username', user.username); 
    await prefs.setInt('id', user.id); 
    }

    Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false; 

    Future<UserModel?> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final id = prefs.getInt('id');
    if (username != null && id != null) {
    return UserModel(username: username, id: id); 
    } else {
    return null;
    }

    Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLogin', false);
  await prefs.remove('username'); 
  await prefs.remove('id'); 
  
}

}
}
}
// source gemini
```


##### 3. local database menggunakan SQLite menyimpan dan memminta data dalam jumlah besar pada local device bersifat privat menggunakan SQLite dengan package sqflite 

menggunakan SQflite

```dart
// tambahkan sqflite ke dependencies
dependencies:
  sqflite: ^2.3.3

// buat folder helpers dan buat file database 

class DatabaseHelper {
  // Database name
  static const String _dbName = 'my_app.db';

  // Table name
  static const String _tableName = 'users';

  // Database instance
  Database? _database;

  // Open the database connection
  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/$_dbName';
    return await openDatabase(path,
      version: 1,
      onCreate: (db, version) {
        // Create the table
        db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT
          )
        ''');
      },
    );
  }


  Future<int> insertUser(UserModel user) async {
    final db = await database;
    final result = await db.insert(_tableName, user.toMap());
    return result;
  }

  Future<bool> checkUsernameExists(String username) async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      columns: ['id'],
      where: 'username = ?',
      whereArgs: [username],
    );
    return maps.isNotEmpty;
  }

  
}

// buat user model 

class UserModel {
  final int? id;
  final String username;
  final String password;

  UserModel({this.id, required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
}


// buat user controller 

class UserController with ChangeNotifier {
  final DatabaseHelper _dbHelper;

  UserController(this._dbHelper);

  Future<bool> register(String username, String password) async {
   
    final isExists = await _dbHelper.checkUsernameExists(username);
    if (isExists) {
      throw Exception('Username already exists.');
    }
    
    final newUser = UserModel(username: username, password: hashedPassword);
    final result = await _dbHelper.insertUser(newUser);
    if (result > 0) {
      
      return true;
    } else {
      throw Exception('Registration failed.');
    }
  }

  
}

// source gemini
```