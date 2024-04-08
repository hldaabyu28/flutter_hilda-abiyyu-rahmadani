import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  List<Map<String, dynamic>> _contacts = [];

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color _currentColor = Colors.orange;

  String? _filePath;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            child: const Icon(
              Icons.phone_android,
              size: 50.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      const Text(
        'Create New Contact',
        style: TextStyle(
          fontSize: 20.0,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
        ),
      ),
      const SizedBox(height: 20.0),
      SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildForm(context),
              buildDatePicker(context),
              buildColorPicker(context),
              buildFilePicker(context),
              buildButton(context),
              
            ],
          ),
        ),
      ),
      buildListContact(context), // Menambahkan buildListContact di bagian akhir body
    ],
  ),
          
     )
  
    );
  }

  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
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
                  }
                  if (value.trim().split(' ').length < 2) {
                    return 'Nama harus terdiri dari minimal 2 kata';
                  }
                  if (!RegExp(r'^[A-Z][a-z]*( [A-Z][a-z]*)*$')
                      .hasMatch(value)) {
                    return 'Setiap kata harus dimulai dengan huruf kapital';
                  }
                  if (value.contains(RegExp(r'[0-9]')) ||
                      value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
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
                      )),
                 
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nomor telepon harus diisi';
                    }
                    if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)) {
                      return 'Nomor telepon harus dimulai dengan angka 0 dan terdiri dari 8-15 digit';
                    }
                  }),
            ],
          )),
    );
  }

  Widget buildButton(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _addContact(_nameController.text, _contactController.text,
                  _dueDate, _currentColor, _filePath);
              _nameController.clear();
              _contactController.clear();
            }

            
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Birth Date'),
            TextButton(
              onPressed: ()async{
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if(selectDate != null){
                    _dueDate = selectDate;
                  }
                
                });
              },
              child: const Text('Select'),
            )
          ]),
          Text(
            DateFormat('dd/MM/yyyy').format(_dueDate),
          ),
        ],
      ),
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Color'),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 90,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick Your color'),
                    content: ColorPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currentColor),
            ),
            child: const Text('Pick Color'),
          ),
        )
      ]),
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pick Files'),
          const SizedBox(height: 10),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    _pickFile();
                  },
                  child: const Text('Pick and openFile'))),
        ],
      ),
    );
  }


Widget buildListContact(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        const Text('Contact List' , style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        )),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text(_contacts[index]['name']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone Number: ${_contacts[index]['phoneNumber']}'),
                    Text('Birth Date: ${DateFormat('dd/MM/yyyy').format(_contacts[index]['date'])}'), // Memformat tanggal
                    Row(
                      children: [
                        Text('Color: '),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(int.parse(_contacts[index]['color'])),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                    Text('File: ${_contacts[index]['file']}'),
                  ],

                ),
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
      ],
    ),
  );
}

void _addContact(String name, String phoneNumber, DateTime _dueDate,
    Color _currentColor, String? _filePath) {
  setState(() {
    _contacts.add({
      'name': name,
      'phoneNumber': phoneNumber,
      'date': _dueDate,
      'color': _currentColor.value.toString(),
      'file': _filePath ?? '',
    });
    print(
        'Added contact: Name - $name, Phone Number - $phoneNumber date: $_dueDate color: $_currentColor File Path: $_filePath');
  });
   showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text('Contact added successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}


  void _editContact(int index) async {
    Map<String, String> result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController =
            TextEditingController(text: _contacts[index]['name']);
        TextEditingController phoneController =
            TextEditingController(text: _contacts[index]['phoneNumber']);

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
                  }
                  if (value.trim().split(' ').length < 2) {
                    return 'Nama harus terdiri dari minimal 2 kata';
                  }
                  if (!RegExp(r'^[A-Z][a-z]*( [A-Z][a-z]*)*$')
                      .hasMatch(value)) {
                    return 'Setiap kata harus dimulai dengan huruf kapital';
                  }
                  if (value.contains(RegExp(r'[0-9]')) ||
                      value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                    return 'Nama tidak boleh mengandung angka atau karakter khusus';
                  }
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
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
                Navigator.pop(
                    context, {'name': name, 'phoneNumber': phoneNumber});
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _contacts[index] = {
        'name': result['name']!,
        'phoneNumber': result['phoneNumber']!,

      };
      });
    }
  }

  void _deleteContact(int index) {
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Contact'),
        content: Text('Are you sure you want to delete this contact?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _contacts.removeAt(index);
                print('Deleted contact at index: $index ');
                Navigator.of(context).pop(); // Close the dialog
              });
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
    
  }

  void _pickFile() async {
   
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
   
        _filePath = result.files.single.path;
        
        print('Selected file path: $_filePath');
      });
    } else {
     
      print('No file selected.');
    }

    final file = result?.files.first;
    _openFile(file!);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}


