
import 'package:flutter/material.dart';
import '../models/product.dart';

class AddProductViewModel extends ChangeNotifier {
  String _name = '';
  double _price = 0;
  String _category = '';
  String _seller = '';

  String get name => _name;
  double get price => _price;
  String get category => _category;
  String get seller => _seller;

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setPrice(double value) {
    _price = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void setSeller(String value) {
    _seller = value;
    notifyListeners();
  }

  void resetFields() {
    _name = '';
    _price = 0;
    _category = '';
    _seller = '';
    notifyListeners();
  }
}
