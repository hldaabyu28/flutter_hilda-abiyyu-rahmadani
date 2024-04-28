import 'package:flutter/material.dart';
import 'package:mvvm/models/api/contact_api.dart';
import 'package:mvvm/models/contact_model.dart';

class ContactViwModel with ChangeNotifier{
  List<Contact> _contacts = [];
  List<Contact> get getContacts => _contacts;

  getAllContact()async{
    final c = await ContactAPI.getContact();
    _contacts = c;
    notifyListeners();
  }
}