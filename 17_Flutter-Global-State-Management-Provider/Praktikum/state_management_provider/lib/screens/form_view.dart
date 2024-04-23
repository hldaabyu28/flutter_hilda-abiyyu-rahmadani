import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/contact_controller.dart';
import 'package:state_management_provider/models/user_model.dart';
import 'package:state_management_provider/widgets/contact_form.dart';

class FormView extends StatelessWidget {
  const FormView({super.key, required Map<String, dynamic> contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Column(
        children: [
          ContactForm(),
        ],
      ),
    );
  }
}