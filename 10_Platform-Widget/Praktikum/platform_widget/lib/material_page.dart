import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<Map<String, String>> profiles = [
    {"name": "Hilda Abiyyu", "email": "abiyyu@gmail.com"},
    {"name": "Prabowo Subianto", "email": "prabowo@gmail.com"},
    {"name": "Joko Widodo", "email": "joko@gmail.com"},
    {"name": "Jokowi", "email": "jokowi@gmail.com"},
    {"name": "Habibie", "email": "habibie@gmail.com"},
    {"name": "Abdul Ghofur", "email": "abdulghofur@gmail.com"},
    {"name": "Abdul Kadir", "email": "abdul1@gmail.com"},
    {"name": "Abdurrahman", "email": "abdul@gmail.com"},
    {"name": "Bayu", "email": "bayu@gmail.com"},
    {"name": "Bambang", "email": "bambang@gmail.com"},
    {"name": "dani", "email": "dani@gmail.com"},
    {"name": "ayu", "email": "ayu@gmail.com"},
    // Add more profiles as needed
  ];
    
    return Scaffold(
      appBar: AppBar (
        title: const Text('Material App' , style: TextStyle(color: Colors.white),
        ) ,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 123, 7, 255),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              
            ),
           
          ]
        ),
        
      ),
      

    
      body: ListView(
        children: profiles.map((profile) {
          String initial = profile["name"]![0]; // Mendapatkan huruf awal dari nama
          return ListTile(
            leading: CircleAvatar(
              child: Text(initial, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
              backgroundColor: Color.fromARGB(255, 255, 218, 7),
            ),
            title: Text(profile["name"]!),
            subtitle: Text(profile["email"]!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(
                    name: profile["name"]!,
                    email: profile["email"]!,
                  ),
                ),
              );
            }
          );
        }).toList(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 123, 7, 255),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      ),
    );

    
  }
}

class Profile extends StatelessWidget {
  final String name;
  final String email;
  const Profile({required this.name, required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color.fromARGB(255, 123, 7, 255),
      ),
      body: Center(
        child: Text(email),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 123, 7, 255),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      ),
    );
  }
} 