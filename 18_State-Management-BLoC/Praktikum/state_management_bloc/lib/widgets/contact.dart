import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/controller/cubit/navigate_cubit.dart';
import 'package:state_management_bloc/screens/contact_screen.dart';


class Contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return ContactScreen();  
      }
    );
  }
}