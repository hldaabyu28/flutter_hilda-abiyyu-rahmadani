import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey();

  @override
  Widget build (BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        key: _formKey,
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
            
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _messageController,
            minLines: 6,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            labelText: 'Enter Message',
        ),
          ),
             ElevatedButton(
            onPressed: () {
              String username = _usernameController.text ;
              String email = _emailController.text;
              String message = _messageController.text;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Data Submitted'),
                    content: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Username: $username'),
                          Text('Email: $email'),
                          Text('Message: $message'),
                        ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _usernameController.clear();
                          _emailController.clear();
                          _messageController.clear();
                          Navigator.of(context).pop();
                          
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}