import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/controller/cubit/navigate_cubit.dart';
import 'package:state_management_bloc/screens/contact_screen.dart';
import 'package:state_management_bloc/screens/galley_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        appBar: AppBar(
          
        ),
        drawer: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return Drawer(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Gallery'),
                    onTap: () {
                      context.read<NavigationCubit>().navigateToGallery();
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Contact'),
                    onTap: () {
                      context.read<NavigationCubit>().navigateToContacts();
                      Navigator.pop(context);
                    },
                  ),
                ]
              )
            );
          }
        ), 
       
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state ) {
            if(state == NavigationState.ContactScreen) {
              return ContactScreen();
            } else {
              return GalleryScreen();
            }
            
          }

        )
      ),
    );
  }
}
