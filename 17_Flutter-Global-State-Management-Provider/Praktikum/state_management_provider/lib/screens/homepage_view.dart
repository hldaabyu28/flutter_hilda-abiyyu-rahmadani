import 'package:flutter/material.dart';
import 'package:state_management_provider/screens/form_view.dart';
import 'package:state_management_provider/screens/list_contact_view.dart';
import 'package:state_management_provider/widgets/contact_form.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Mangament Provider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FormView(contact: {
                'name': '',
                'phone': '',
              },)));
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to Flutter',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Contact List'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactList()));
              },
            ),
          ]
        )
      )
      
    );
  }
}