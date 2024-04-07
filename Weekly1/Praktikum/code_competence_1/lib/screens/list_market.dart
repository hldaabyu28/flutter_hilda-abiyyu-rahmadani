import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget{
  
  List<Map<String, dynamic>> listProduct = [
    {
      'name': 'Apple',
      'price': 10000,
    },
    {
      'name': 'Banana',
      'price': 20000,
    },
    {
      'name': 'Orange',
      'price': 30000,
    },

  ];

  ListProduct({super.key});

  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        for(var i = 0; i < listProduct.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(listProduct[i]['name'], style: TextStyle(),),
              subtitle: Text(listProduct[i]['price'].toString()),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {  },
              ),
              tileColor: Color.fromARGB(255, 40, 182, 90),
            ),
          ),
      ]
    );
  }

}