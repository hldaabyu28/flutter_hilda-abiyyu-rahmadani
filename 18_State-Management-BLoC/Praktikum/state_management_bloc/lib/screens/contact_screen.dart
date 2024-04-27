import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/contact_bloc.dart';
import 'package:state_management_bloc/models/contact_model.dart';
import 'package:state_management_bloc/widgets/empty_screen.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List' , 
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    final contact = ContactModel(
                      name: _nameController.text, 
                      phone: _phoneController.text,
                      date: DateTime.now().toString(),
                      color: 'blue',
                      image: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                    );
                    if(contact.name.isNotEmpty && contact.phone.isNotEmpty){
                      context.read<ContactBloc>().add(AddContact(contact));
                    _nameController.clear();
                    _phoneController.clear();

                    final snackBar = SnackBar(
                      content: Text('Data Telah Ditambahkan'),
                      backgroundColor: Colors.greenAccent,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                    }
      
      
                    const snackBar = SnackBar(content: 
                    Text('Ada Data Yang Kosong!'),
                    backgroundColor: Colors.redAccent,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, 
                child: Text('Add')
               ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if(state.contacts.isEmpty){
                  return const EmptyScreen();
                }
                return ListView.builder(
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = state.contacts[index];
                    return Card(
                      child: ListTile(
                          title: Text(contact.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(contact.phone),
                              Text(contact.date),
                              Text(contact.color),
                              Text(contact.image),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                 icon: const Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context, 
                            builder: (contextDialog) {
                              return AlertDialog(
                                title: const Text('Delete Contact'),
                                content: const Text('Are you sure want to delete this contact?'),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(contextDialog);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      context.read<ContactBloc>().add(DeleteContact(contact));
                                      final snackBar = SnackBar(
                                        content: Text('Data Telah Dihapus'),
                                        backgroundColor: Colors.redAccent,
                                      );
                                      Navigator.pop(contextDialog);

                                    },
                                    child: const Text('Delete'),
                                  )
                                ],
                              );
                            });
                        },
                              )
                            ]
                          ),
                      )
                    );
                  }
                );
              }
            )
          ),
      
        ],
      )
    );
  }
}