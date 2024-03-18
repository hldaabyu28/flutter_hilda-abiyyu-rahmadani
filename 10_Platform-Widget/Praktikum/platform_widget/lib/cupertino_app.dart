import 'package:flutter/cupertino.dart';
import './cupertino_page.dart';

class AppCupertino extends StatelessWidget {
  final _themeDart = const CupertinoThemeData.raw(
    Brightness.dark, 
    null, 
    null, 
    null, 
    null,
    null, 
    null);

  @override
  Widget build(BuildContext context) {
    
    return CupertinoApp(
      theme: _themeDart,
      home : HomePage(),
    );
  }
}