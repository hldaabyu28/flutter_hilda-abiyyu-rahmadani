import 'package:flutter/material.dart';
import 'package:rest_api_client/screens/post_screen.dart';
import '../models/contact_model.dart';
import '../services/contact_service.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Contact? _contact;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
            } 
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
                final contactService = ContactService();
                try {
                  final contact = await contactService.fetchContact(2); 
                  setState(() {
                    _contact = contact;
                    _isLoading = false;
                  });
                } catch (error) {
                  print('Error fetching contact: $error');
                  setState(() {
                    _isLoading = false;
                    _errorMessage = 'Failed to fetch contact: $error';
                  });
                }
              },
              child: Text('Fetch Contact'),
            ),
            if (_isLoading)
              CircularProgressIndicator()
            else if (_errorMessage != null)
              Text(_errorMessage!)
            else if (_contact != null)
              ListTile(
                title: Text(_contact!.id.toString()),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${_contact!.name}'),
                    Text('Phone: ${_contact!.phone}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
