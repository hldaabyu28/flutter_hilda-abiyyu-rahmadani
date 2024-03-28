import 'package:flutter/material.dart';
import 'package:form_input/app/MyApp.dart';
import 'package:form_input/screen/HomePage.dart';



void main() {
  runApp(MyApp());
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(ContactApp());
// }

// class Contact {
//   String name;
//   String phoneNumber;

//   Contact({required this.name, required this.phoneNumber});
// }

// class ContactApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Contact App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ContactListScreen(),
//     );
//   }
// }

// class ContactListScreen extends StatefulWidget {
//   @override
//   _ContactListScreenState createState() => _ContactListScreenState();
// }

// class _ContactListScreenState extends State<ContactListScreen> {
//   final List<Contact> _contacts = [];

//   void _addContact(String name, String phoneNumber) {
//     setState(() {
//       _contacts.add(Contact(name: name, phoneNumber: phoneNumber));
//     });
//   }

//   void _editContact(int index, String name, String phoneNumber) {
//     setState(() {
//       _contacts[index].name = name;
//       _contacts[index].phoneNumber = phoneNumber;
//     });
//   }

//   void _deleteContact(int index) {
//     setState(() {
//       _contacts.removeAt(index);
//     });
//   }

//   void _navigateToAddContactScreen(BuildContext context) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddContactScreen()),
//     );

//     if (result != null) {
//       Map<String, String> data = result;
//       _addContact(data['name']!, data['phoneNumber']!);
//     }
//   }

//   void _navigateToEditContactScreen(BuildContext context, int index) async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EditContactScreen(
//           name: _contacts[index].name,
//           phoneNumber: _contacts[index].phoneNumber,
//         ),
//       ),
//     );

//     if (result != null) {
//       Map<String, String> data = result;
//       _editContact(index, data['name']!, data['phoneNumber']!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contact List'),
//       ),
//       body: ListView.builder(
//         itemCount: _contacts.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_contacts[index].name),
//             subtitle: Text(_contacts[index].phoneNumber),
//             onTap: () => _navigateToEditContactScreen(context, index),
//             trailing: IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () => _deleteContact(index),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _navigateToAddContactScreen(context),
//         tooltip: 'Add Contact',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class AddContactScreen extends StatelessWidget {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Contact'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _phoneNumberController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String name = _nameController.text;
//                 String phoneNumber = _phoneNumberController.text;
//                 Navigator.pop(
//                   context,
//                   {'name': name, 'phoneNumber': phoneNumber},
//                 );
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EditContactScreen extends StatelessWidget {
//   final TextEditingController _nameController;
//   final TextEditingController _phoneNumberController;

//   EditContactScreen({required String name, required String phoneNumber})
//       : _nameController = TextEditingController(text: name),
//         _phoneNumberController = TextEditingController(text: phoneNumber);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Contact'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _phoneNumberController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String name = _nameController.text;
//                 String phoneNumber = _phoneNumberController.text;
//                 Navigator.pop(
//                   context,
//                   {'name': name, 'phoneNumber': phoneNumber},
//                 );
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
