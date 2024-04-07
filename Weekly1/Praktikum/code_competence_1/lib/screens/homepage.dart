import 'package:code_competence_1/screens/form.dart';
import 'package:flutter/material.dart';
import 'package:code_competence_1/screens/welcome.dart';
import 'package:code_competence_1/screens/list_market.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 66, 173, 70),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white,),
            onPressed: () {  },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Welcome(),
            SizedBox(height: 50,),
            ListProduct(),
            SizedBox(height: 50,),
            Text('Contact Us', style: TextStyle(fontSize: 20),),
            FormPage(),
            
          ],
        ),
      ), 
    );
  }
}
