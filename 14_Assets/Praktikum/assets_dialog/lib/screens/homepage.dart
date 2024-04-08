import 'package:assets_dialog/models/list_image.dart';
import 'package:assets_dialog/screens/contact.dart';
import 'package:assets_dialog/screens/list_gallery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  get listImage => ListImage(
    image: [
      'assets/images/apel.jpg',
      'assets/images/durian.jpg',
      'assets/images/pepaya.jpg',
      'assets/images/mangga.jpg',
    ]
  );
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',  style: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Center(
          
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset('assets/images/search.png' , width: 100 , height: 100 ),
              Text(
                'Welcome To Home',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        )
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('List Gallery' , style: GoogleFonts.plusJakartaSans()),
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => ListGallery(listImage: listImage)),
                );
              },
            ),
            ListTile(
              title: Text('Contact' ,  style: GoogleFonts.plusJakartaSans()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            ListTile(
              title: Text('Exit' ,  style: GoogleFonts.plusJakartaSans()),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}