import 'package:flutter/material.dart';
import '../screen/HomePage.dart';


class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Form Input',
      home: HomePage(), 
      
    );
  }
}
