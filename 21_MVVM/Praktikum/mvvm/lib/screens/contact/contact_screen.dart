import 'package:flutter/material.dart';
import 'package:mvvm/screens/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViwModel>(context, listen: false).getAllContact();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViwModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact" , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: modelView.getContacts.length,
        itemBuilder: (context, index) {
          final contact = modelView.getContacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phone),
          );
        }
      ),
    );
  }
}