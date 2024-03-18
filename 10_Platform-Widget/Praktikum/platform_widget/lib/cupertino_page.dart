import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return const CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar (
        middle: Text('Cupertino App' , style: TextStyle(),
        ) ,
        backgroundColor: Color.fromARGB(255, 7, 102, 255),
      ),
      child:Center(
        child: Text('This is CupertinoApp')
      ),
    );
 
  }
}