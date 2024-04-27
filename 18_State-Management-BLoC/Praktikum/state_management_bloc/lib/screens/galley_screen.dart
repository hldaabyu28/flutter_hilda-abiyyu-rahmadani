import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/gallery_bloc.dart';
import 'package:state_management_bloc/widgets/empty_screen.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Gallery Screen'),
     ),
     body: BlocBuilder <GalleryBloc, GalleryState>(
       builder: (context, state) {
         if(state.nameImage.isEmpty) {
           return EmptyScreen();
         }
         return GridView.builder(
           itemCount: state.nameImage.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             crossAxisSpacing: 10,
             mainAxisSpacing: 10
             
           ), itemBuilder: (BuildContext context, int index) { 
             return Image.network(state.nameImage[index].url);
            },
           
         );
       }
     )
   );
    
  }
}