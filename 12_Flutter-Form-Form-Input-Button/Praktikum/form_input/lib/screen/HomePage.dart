import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  List<Map<String, String>> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 65, 33, 243),
        leading: const Icon(Icons.contacts, color: Colors.white),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: const Center(
                      child: Icon(Icons.phone_android, size: 50.0, color: Color.fromARGB(255, 255, 255, 255),),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),              
                  ),
                  const Text('Create New Contact', style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama harus diisi';
                            } if (value.trim().split(' ').length < 2){
                              return 'Nama harus terdiri dari minimal 2 kata';
                            } if (!RegExp(r'^[A-Z][a-z]*( [A-Z][a-z]*)*$').hasMatch(value)){
                              return 'Setiap kata harus dimulai dengan huruf kapital';
                            } if (value.contains(RegExp(r'[0-9]')) || value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))){
                              return 'Nama tidak boleh mengandung angka atau karakter khusus';
                            }
                          }, 
                        ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                       controller: _contactController,
                       keyboardType: TextInputType.phone,
                       decoration: const InputDecoration(
                         labelText: 'Contact Number',
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         )
                       ),
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Nomor telepon harus diisi';
                         }if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)){
                           return 'Nomor telepon harus dimulai dengan angka 0 dan terdiri dari 8-15 digit';
                         }
                       } 
                      ),
                      const SizedBox(height: 20.0),
                       ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _addContact(_nameController.text, _contactController.text);
                              _nameController.clear();
                              _contactController.clear();
                              print('Form submitted');
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                      ), 
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Text('Contact List', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text(_contacts[index]['name']!),
                    subtitle: Text(_contacts[index]['phoneNumber']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editContact(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteContact(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addContact(String name, String phoneNumber) {
    setState(() {
      _contacts.add({'name': name, 'phoneNumber': phoneNumber});
      print('Added contact: Name - $name, Phone Number - $phoneNumber');

    });
  }

  void _editContact(int index) async {
    Map<String, String>? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController(text: _contacts[index]['name']);
        TextEditingController phoneController = TextEditingController(text: _contacts[index]['phoneNumber']);

        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama harus diisi';
                            } if (value.trim().split(' ').length < 2){
                              return 'Nama harus terdiri dari minimal 2 kata';
                            } if (!RegExp(r'^[A-Z][a-z]*( [A-Z][a-z]*)*$').hasMatch(value)){
                              return 'Setiap kata harus dimulai dengan huruf kapital';
                            } if (value.contains(RegExp(r'[0-9]')) || value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))){
                              return 'Nama tidak boleh mengandung angka atau karakter khusus';
                            }
                          }, 
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                 validator:(value){
                     if (value!.isEmpty) {
                        return 'Nomor telepon harus diisi';
                      }
                      if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)) {
                        return 'Nomor telepon harus dimulai dengan angka 0 dan terdiri dari 8-15 digit';
                      }
                  },
                
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String phoneNumber = phoneController.text;
                Navigator.pop(context, {'name': name, 'phoneNumber': phoneNumber});
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _contacts[index] = {'name': result['name']!, 'phoneNumber': result['phoneNumber']!};
      });
    }
  }

  void _deleteContact(int index ) {
    setState(() {
      _contacts.removeAt(index);
      print('Deleted contact at index: $index');
    });
  }
}
