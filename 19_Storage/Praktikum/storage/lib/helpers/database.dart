import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:storage/models/user_model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final dbPath = join(await getDatabasesPath(), 'user_database.db');
    _database = await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)',
        );
      },
      version: 1,
    );
    return _database;
  }

  Future<bool> insertUser(UserModel newUser) async {
    final db = await database;
    final batch = db.batch();

    batch.insert('users', newUser.toMap());

    try {
      await batch.commit();
      return true; // Registration successful
    } catch (error) {
      print('Error inserting user: $error');
      return false; // Registration failed
    }
  }

  Future<UserModel> checkUser(String username, String password) async {
    final db = await database;
    var res = await db.query("users",
        where: "username = ? AND password = ?", whereArgs: [username, password]);
    return res.isNotEmpty ? UserModel.fromMap(res.first) : UserModel(username: '', password: '');
  }

  Future<bool> checkUsernameExists(String username) async {
  final db = await database;
  var res = await db.rawQuery("SELECT * FROM users WHERE username = ?", [username]);
  return res.isNotEmpty; 
}

}
