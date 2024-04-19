// viewmodel/home_view_model.dart
import 'package:flutter/material.dart';
import '../models/user.dart';

class HomeViewModel extends ChangeNotifier {
  late User _user;

  User get user => _user;

  HomeViewModel() {
    _user = User(name: 'Hilda', email: 'abiyyu@gmail.com');
  }
}
