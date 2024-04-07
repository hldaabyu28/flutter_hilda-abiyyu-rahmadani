import 'package:flutter/material.dart';

class Welcome extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/market.png', width: 150, height: 150,),
              SizedBox(height: 20,),
              Text('Welcome To Market', style: TextStyle(fontSize: 20),),
            ]
            
          ),
        ),
      ),
    );
  }
}