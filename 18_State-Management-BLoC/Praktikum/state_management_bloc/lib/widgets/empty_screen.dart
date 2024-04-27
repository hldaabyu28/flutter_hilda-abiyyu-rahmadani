import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center (
      child: Text(
        'Data Tidak Ditemukan',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
    );
  }
}