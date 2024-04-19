import 'package:flutter/material.dart';
import '../viewmodel/home_view_model.dart';
import '../models/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = HomeViewModel();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${homeViewModel.user.name}'),
            Text('Email: ${homeViewModel.user.email}'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
      case 0:
        break; 
      case 1:
        Navigator.pushNamed(context, '/listProduct');
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
    }
        },
      ),
    );
  }
}
