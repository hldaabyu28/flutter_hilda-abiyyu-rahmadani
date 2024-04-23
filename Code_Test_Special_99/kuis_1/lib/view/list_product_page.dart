import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/list_product_view_model.dart';
import '../models/product.dart';

class ListProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listProductViewModel = Provider.of<ListProductViewModel>(context);
    final products = listProductViewModel.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addProduct');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Image.network('https://picsum.photos/200/300?grayscale',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    )),
                    Text('name ${product.name}'),
                    SizedBox(height: 5.0),
                    Text('Price: ${product.price.toString()}'),
                    SizedBox(height: 5.0),
                    Text('Category: ${product.category}'),
                    SizedBox(height: 5.0),
                    Text('Seller: ${product.seller}'),
                    SizedBox(height: 5.0),
                    Text('Total checkout'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.popUntil(context, ModalRoute.withName('/'));
              break; 
            case 1:
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
