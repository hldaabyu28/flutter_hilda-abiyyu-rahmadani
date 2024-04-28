import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/screens/contact/contact_screen.dart';
import 'package:mvvm/screens/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ContactViwModel()),
    ],
    child: MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,

      ), 
      home: ContactScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
