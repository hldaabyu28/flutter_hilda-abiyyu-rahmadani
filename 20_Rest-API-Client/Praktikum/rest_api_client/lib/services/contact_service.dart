import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/contact_model.dart';

class ContactService {
  final Dio _dio = Dio();

 
Future<Contact> fetchContact(int id) async {
  try {
    final response = await _dio.get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$id',
    );

    print(response.data);

    if (response.statusCode == 200) {
      final responseData = response.data;
      if (responseData != null) {
        return Contact.fromJson(responseData);
      } else {
        throw Exception('Response data is null');
      }
    } else {
      throw Exception('Failed to fetch contact: Status code ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching contact: $e');
    throw Exception('Failed to fetch contact: $e');
  }
}




  Future<void> sendContact(Contact contact) async {
    try {
      final response = await _dio.post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
        data: contact.toJson(),
      );

      if (response.statusCode == 200) {
        print('Contact sent successfully');
      } else {
        print('Failed to send contact: ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('Error sending contact: ${e.message}');
    }
  }

  fetchContacts() {}
}
