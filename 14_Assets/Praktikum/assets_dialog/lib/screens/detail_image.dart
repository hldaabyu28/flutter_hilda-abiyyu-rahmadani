import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_dialog/models/list_image.dart';
import 'package:assets_dialog/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailImage extends StatelessWidget {
  final String imagePath;
  DetailImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Image', style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight : FontWeight.bold
          ),),
        ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Center(
            child: Image.asset(imagePath),
          ),
        ));
  }
}
