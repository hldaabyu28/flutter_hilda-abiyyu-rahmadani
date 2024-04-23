import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/controllers/contact_controller.dart';
import 'package:state_management_provider/widgets/contact_card.dart';


class ContactList extends StatelessWidget{
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Consumer<ContactController>(
        builder: (context, contactController, child) {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemCount: contactController.contacts.length,
            itemBuilder: (context, index) {
              return ContactCard(contact: contactController.contacts[index]);
            }
          );
        }
      )
    );
  }
}