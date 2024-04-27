import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/controllers/user_controller.dart';
import 'package:storage/preferences/user_preferences.dart';
import 'package:storage/screens/homepage.dart';
import 'package:storage/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()),
        
      ],
      child: MaterialApp(
        title: 'Flutter Storage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: UserPreferences.getUserLogin() == true ? const HomePage() : const LoginScreen(),
          
      )
    );
  }
}