import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/contact_controller.dart';


class ContactForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        key: _formKey,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
                
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone',
            )    
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Provider.of<ContactController>(context, listen: false).addContact({'name': _nameController.text, 'phone': _phoneController.text});
              Navigator.pop(context);
              print('nama :${_nameController.text}');
              print('phone:${_phoneController.text}');
            },
            child: const Text('Submit'), 
          )
        ]
      ),
    );
  }
}

