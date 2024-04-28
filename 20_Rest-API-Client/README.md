# Summary


##### 1. - Rest API Client : Representational State Transfer Progamming Interface merupakan arsitektural yang memisahkan tampilan dengan proses bisnis dan bagian tampilan dengan proses bisnis berkirim data melalui HTTP request 
#####    - HTTP merupakan protokol yang digunakan untuk berkirim data pada internet biasanya data tersebut berbentuk media web pola komunikasi dengan menggunakan Client mengirim request dan server akan mengolah dan membalas dengan memberi response 
######      - Struktur Request   : - Url alamat halaman yang akan diakses 
######                             - Method(GET, POST, PUT, DELETE) menunjukkan aksi yang diinginkan 
######                             - Header informasi tambahan terkait request yang di kirim 
######                             - Body Data yang disertai bersama request
######       - Struktur Response : - Status Code kode yang mewakili keseluruhan response baik sukses maupun gagal
######                             - Header Informasi tambahan terkait response yang diberikan 
######                             - Body Data yang disertakan bersama response
##### 2. - Dio sebagai HTTP client dan dimanfaatkan untuk melakukan REST API 

Penggunaan Dio

```dart
// tambahkan ke dependency  pada pubspec.yaml
dependencies:
  dio: ^5.4.3+1

import 'package:dio/dio.dart';

Dio.get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/').then((response){
  print(response);
});

```

#####    - Serialisasi JSON mengubah struktur data ke bentuk JSON 

```dart

   class User {
  final int id;
  final String name;
  final String phone;

  User(this.id, this.name, this.phone);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
  };
}

void main() {
  User user = User(1, "John Doe", "+1234567890");
  Map<String, dynamic> userMap = user.toJson();
  String jsonString = jsonEncode(userMap);
  print(jsonString); // Output: {"id": 1, "name": "John Doe", "phone": "+1234567890"}
}


```

#####    - Deserialisasi JSON mengubah bentuk JSON ke struktur data

```dart
factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }

 

String jsonString = '{"id": 1, "name": "John Doe", "phone": "+1234567890"}';
Map<String, dynamic> jsonMap = jsonDecode(jsonString);
Contact contact = Contact.fromJson(jsonMap);

print(contact.id); // Output: 1
print(contact.name); // Output: John Doe
print(contact.phone); // Output: +1234567890


```

##### 3. Consume REST API 


```dart
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


```