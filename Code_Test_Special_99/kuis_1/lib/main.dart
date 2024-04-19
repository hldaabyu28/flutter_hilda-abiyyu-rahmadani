// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home_page.dart';
import 'view/list_product_page.dart';
import 'view/add_product_page.dart';
import 'view/profile_page.dart';
import 'viewmodel/add_product_view_model.dart';
import 'viewmodel/list_product_view_model.dart';
import 'viewmodel/profile_view_model.dart';
import 'viewmodel/home_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddProductViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ListProductViewModel()), 
        ChangeNotifierProxyProvider<ListProductViewModel, ProfileViewModel>(
          create: (_) => ProfileViewModel(listProductViewModel: ListProductViewModel()),
          update: (_, listProductViewModel, __) => ProfileViewModel(listProductViewModel: listProductViewModel),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM & Provider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/listProduct': (context) => ListProductPage(),
        '/addProduct': (context) => AddProductPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
