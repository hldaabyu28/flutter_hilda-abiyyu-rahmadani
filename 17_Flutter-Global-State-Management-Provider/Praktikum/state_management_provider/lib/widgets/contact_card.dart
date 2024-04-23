import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/screens/form_view.dart';
import '../controllers/contact_controller.dart';

class ContactCard extends StatelessWidget {
  final Map<String, dynamic> contact;

  const ContactCard({required this.contact, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact['name']),
        subtitle: Text(contact['phone']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Apakah kamu yakin ingin menghapus kontak ini?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tidak'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Provider.of<ContactController>(context, listen: false).removeContact(contact);
                          },
                          child: const Text('Ya'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                // Panggil metode editContact dan tunggu hasilnya
                Map<String, dynamic>? editedContact = await Provider.of<ContactController>(context, listen: false).editContact(context, contact);
                if (editedContact != null) {
                  // Jika data kontak diedit, perbarui kontak
                  Provider.of<ContactController>(context, listen: false).removeContact(contact);
                  Provider.of<ContactController>(context, listen: false).addContact(editedContact);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
