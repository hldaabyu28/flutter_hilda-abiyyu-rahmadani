import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';


class ContactController extends ChangeNotifier {
  final List<Map<String, dynamic>> _contacts = [];
  List<Map<String, dynamic>> get contacts => _contacts;

  void addContact(Map<String, dynamic> contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void removeContact(Map<String, dynamic> contact) {
    _contacts.remove(contact);
    notifyListeners();
  }
  
  Future<Map<String, dynamic>?> editContact(BuildContext context, Map<String, dynamic> contact) async {
  TextEditingController nameController = TextEditingController(text: contact['name']);
  TextEditingController phoneController = TextEditingController(text: contact['phone']);

  Map<String, dynamic>? editedContact = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, null); // Mengembalikan null untuk menandakan pembatalan
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Map<String, dynamic> editedData = {
                'name': nameController.text,
                'phone': phoneController.text,
              };
              Navigator.pop(context, editedData); // Mengembalikan data yang diedit
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );

  return editedContact; // Mengembalikan data yang diedit atau null jika pembatalan
}

}