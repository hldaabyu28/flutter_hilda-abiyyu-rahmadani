
import 'package:storage/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUserLogin(bool value) async => await _preferences!.setBool('isLogin', value);

  static Future setUser(UserModel user) async {
    await _preferences!.setInt('id', user.id!);
    await _preferences!.setBool('isLogin', true);
    await _preferences!.setString('username', user.username);
    await _preferences!.setString('password', user.password);
  }

  static bool? getUserLogin() => _preferences!.getBool('isLogin');
  static int? getUserId() => _preferences!.getInt('id');
  static String? getUsername() => _preferences!.getString('username');
  static String? getPassword() => _preferences!.getString('password');

  static Future setUserLogout() async {
    await _preferences!.setBool('isLogin', false);
    await _preferences!.remove('id');
    await _preferences!.remove('username');
    await _preferences!.remove('password');
  }

  




}