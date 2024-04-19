import 'package:flutter/material.dart';
import 'list_product_view_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final ListProductViewModel listProductViewModel;

  ProfileViewModel({required this.listProductViewModel});

  int get productListCount => listProductViewModel.products.length;
}
