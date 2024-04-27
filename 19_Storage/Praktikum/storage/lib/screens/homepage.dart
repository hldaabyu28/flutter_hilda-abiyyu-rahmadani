import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage/controllers/user_controller.dart';
import 'package:storage/screens/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _username = Provider.of<UserController>(context, listen: false).user?.username ?? '';
  }

  void _logout() async {
    Provider.of<UserController>(context, listen: false).logout();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserController>(context);

    // Update username if user state changes
    if (user.user?.username != _username) {
      _username = user.user?.username ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: _logout,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $_username!'),
          ],
        ),
      ),
    );
  }
}
