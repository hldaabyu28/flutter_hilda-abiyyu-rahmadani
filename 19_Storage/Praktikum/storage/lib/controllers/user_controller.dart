// import 'package:flutter/material.dart';
// import 'package:storage/helpers/database.dart';
// import 'package:storage/preferences/user_preferences.dart';
// import '../models/user_model.dart';

// class UserController with ChangeNotifier {
//   UserModel? _user;
//   bool _isLogin = false;

//   bool get isLogin => _isLogin;
//   UserModel? get user => _user;

//   void login(String username, String password) async{
//     var dbHelper = DatabaseHelper();
//     UserModel isUser = await dbHelper.checkUser(username, password);
//     notifyListeners();

//     if (isUser.username != '' && isUser.password != '') {
//       _user = isUser;
//       _isLogin = true;
//       UserPreferences.setUserLogin(_isLogin);
//       UserPreferences.setUser(_user!);
//       notifyListeners();
      
//     } 
//   }

//   void logout(){
//     _isLogin = false;
//     UserPreferences.setUserLogin(_isLogin);
//     notifyListeners();
    
//   }

  
// }


// import 'package:flutter/material.dart';
// import 'package:storage/helpers/database.dart';
// import 'package:storage/preferences/user_preferences.dart';
// import '../models/user_model.dart';

// class UserController with ChangeNotifier {
//   UserModel? _user;
//   bool _isLogin = false;

//   bool get isLogin => _isLogin;
//   UserModel? get user => _user;

//   Future<bool> register(String username, String password) async {
//     // Validate username and password (consider using a validator package)
//     if (username.isEmpty || password.isEmpty) {
//       throw Exception('Username and password cannot be empty.');
//     }

//     var dbHelper = DatabaseHelper();
//     final isUserExists = await dbHelper.checkUsernameExists(username);
//     if (isUserExists) {
//       throw Exception('Username already exists.');
//     }

//     // Hash the password before storing (consider using a secure hashing algorithm like bcrypt)
//     final hashedPassword = await _hashPassword(password);

//     final newUser = UserModel(username: username, password: hashedPassword);
//     final result = await dbHelper.insertUser(newUser);

//     if (result == true) {
//       _user = newUser;
//       _isLogin = true;
//       UserPreferences.setUserLogin(_isLogin);
//       UserPreferences.setUser(_user!);
//       notifyListeners();
//       return true;
//     } else {
//       throw Exception('Registration failed.'); // Provide more specific error handling if possible
//     }
//   }

//   Future<String> _hashPassword(String password) async {
    
//     return 'hashed_password'; // Placeholder for hashed password
//   }

//   void login(String username, String password) async {
//     var dbHelper = DatabaseHelper();
//     UserModel? isUser = await dbHelper.checkUser(username, password);

//     if (isUser != null) {
//       _user = isUser;
//       _isLogin = true;
//       UserPreferences.setUserLogin(_isLogin);
//       UserPreferences.setUser(_user!);
//       notifyListeners();
//     } else {
//       throw Exception('Invalid username or password.');
//     }
//   }

//   void logout() {
//     _isLogin = false;
//     UserPreferences.setUserLogin(_isLogin);
//     notifyListeners();
//   }

  
// }

// import 'package:flutter/material.dart';
// import 'package:storage/helpers/database.dart';
// import 'package:storage/preferences/user_preferences.dart';
// import '../models/user_model.dart';

// class UserController with ChangeNotifier {
//   UserModel? _user;
//   bool _isLogin = false;

//   bool get isLogin => _isLogin;
//   UserModel? get user => _user;

//   void login(String username, String password) async{
//     var dbHelper = DatabaseHelper();
//     UserModel isUser = await dbHelper.checkUser(username, password);
//     notifyListeners();

//     if (isUser.username != '' && isUser.password != '') {
//       _user = isUser;
//       _isLogin = true;
//       UserPreferences.setUserLogin(_isLogin);
//       UserPreferences.setUser(_user!);
//       notifyListeners();
      
//     } 
//   }

//   void logout(){
//     _isLogin = false;
//     UserPreferences.setUserLogin(_isLogin);
//     notifyListeners();
    
//   }

  
// }


import 'package:flutter/material.dart';
import 'package:storage/helpers/database.dart';
import 'package:storage/preferences/user_preferences.dart';
import '../models/user_model.dart';

class UserController with ChangeNotifier {
  UserModel? _user;
  bool _isLogin = false;

  bool get isLogin => _isLogin;
  UserModel? get user => _user;

  Future<bool> register(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and password cannot be empty.');
    }

    var dbHelper = DatabaseHelper();
    final isUserExists = await dbHelper.checkUsernameExists(username);
    if (isUserExists == true) {
      print('Username already exists.');
    }

    final hashedPassword = await _hashPassword(password);

    final newUser = UserModel(username: username, password: hashedPassword);
    final result = await dbHelper.insertUser(newUser);

    if (result == true) {
      _user = newUser;
      _isLogin = true;
      UserPreferences.setUserLogin(_isLogin);
      UserPreferences.setUser(_user!);
      notifyListeners();
      return true;
    } else {
      throw Exception('Registration failed.'); 
    }
  }

  Future<String> _hashPassword(String password) async {
    
    return 'hashed_password'; 
  }

  void login(String username, String password) async {
    var dbHelper = DatabaseHelper();
    UserModel? isUser = await dbHelper.checkUser(username, password);

    _user = isUser;
    _isLogin = true;
    UserPreferences.setUserLogin(_isLogin);
    UserPreferences.setUser(_user!);
    notifyListeners();
    }

  void logout() {
    _isLogin = false;
    UserPreferences.setUserLogin(_isLogin);
    notifyListeners();
  }

  
}
