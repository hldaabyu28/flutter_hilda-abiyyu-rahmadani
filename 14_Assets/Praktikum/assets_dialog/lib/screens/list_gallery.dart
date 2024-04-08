import 'package:flutter/material.dart';
import 'package:assets_dialog/models/list_image.dart';
import 'package:assets_dialog/screens/detail_image.dart';

class ListGallery extends StatelessWidget {
  final ListImage listImage;

  ListGallery({required this.listImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Gallery'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: listImage.image.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      
                      builder: (context) {
                        
                        return Column(
                          children: [
                            Text('Image ${index + 1}'),
                            SizedBox(height: 20),
                            
                            Image.asset(
                              listImage.image[index],
                              
                              height: 200,
                            ),
                            Text('Apakah yakin anda akan membuka gambar ini?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailImage(imagePath: listImage.image[index]),
                                  ),
                                );
                              },
                              child: Text('Ya'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Tidak'),
                            ),
                          ],
                        );
                        
                        
                      },
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            listImage.image[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Image ${index + 1}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
