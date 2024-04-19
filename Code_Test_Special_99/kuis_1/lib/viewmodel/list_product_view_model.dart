import 'package:flutter/material.dart';
import '../models/product.dart';

class ListProductViewModel extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
