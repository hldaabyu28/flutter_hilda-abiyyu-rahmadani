import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/add_product_view_model.dart';
import '../viewmodel/list_product_view_model.dart';
import '../models/product.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addProductViewModel = Provider.of<AddProductViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => addProductViewModel.setName(value),
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => addProductViewModel.setPrice(double.tryParse(value) ?? 0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 10),
            // Dropdown for selecting category
            DropdownButtonFormField(
              value: addProductViewModel.category,
              decoration: InputDecoration(labelText: 'Category'),
              items: [
                DropdownMenuItem(child: Text('Food'), value: 'Food'),
                DropdownMenuItem(child: Text('Electronic'), value: 'Electronic'),
                DropdownMenuItem(child: Text('Clothing'), value: 'Clothing'),
              ],
              onChanged: (value) => addProductViewModel.setCategory(value.toString()),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => addProductViewModel.setSeller(value),
              decoration: InputDecoration(labelText: 'Seller'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final ListProductViewModel listProductViewModel = Provider.of<ListProductViewModel>(context, listen: false);
                final AddProductViewModel addProductViewModel = Provider.of<AddProductViewModel>(context, listen: false);

                final Product newProduct = Product(
                  name: addProductViewModel.name,
                  price: addProductViewModel.price,
                  category: addProductViewModel.category,
                  seller: addProductViewModel.seller,
                );

                listProductViewModel.addProduct(newProduct);
                addProductViewModel.resetFields();
                Navigator.pop(context);
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
