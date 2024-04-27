import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/contact_bloc.dart';
import 'package:state_management_bloc/bloc/gallery_bloc.dart';
import 'package:state_management_bloc/controller/cubit/navigate_cubit.dart';
import 'package:state_management_bloc/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'State Mangement - Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ContactBloc()..add(GetContacts())),
            BlocProvider(create: (context) => NavigationCubit()),
            BlocProvider(create: (context) => GalleryBloc()..add(GetGallery())), 
            
        ],
          child: HomePage(),
        )
      );
  }
}
