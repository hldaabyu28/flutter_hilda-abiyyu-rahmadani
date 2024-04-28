import 'package:flutter/material.dart';
import 'package:rest_api_client/screens/contact_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Example',
      home: ContactScreen(),
    );
  }
}
