import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final List<String> Learn = [
    "Learn Mobile",
    "Learn Web",
    "Learn Flutter",
    "Learn C#",
    "Learn C++",
    "Learn Java",
    "Learn Python",
    "Learn C",
    "Learn C#",
    "Learn C++",
    "Learn Ios",
    "Learn Android",
    "Learn Dart",
    "Learn Javascript", 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text("Alta - WIdget Layout - Exploration", style: TextStyle(
    color: Colors.white, 
    )),
    centerTitle: true,
    backgroundColor: Color(0xFF00A8E8),
    actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: (
        
      ) {
        // do something
      },
    )
    ],

    ),

    body: ListView(
       children: Learn.map((Learn) {
          return ListTile(
            // contentPadding: EdgeInsets.all(10.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LearnCategories(
                  learn: Learn,
                  )),
              );
            },
            title: Text(Learn, style: TextStyle(color: Color(0xFF00A8E8)),),
            
          );
        }).toList(),
    ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFA8E800),
        shape: CircleBorder(),
        onPressed: () {
        },
        child: const Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255),),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color(0xFF00A8E8),
        selectedLabelStyle: TextStyle(color: Color(0xFF00A8E8)),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Color(0xFF00A8E8)), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
      ],
      ),
    );
  }
  }


class LearnCategories extends StatelessWidget {
  final String learn ;

  LearnCategories({required this.learn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: const Text("Alta - WIdget Layout - Exploration", style: TextStyle(
    color: Colors.white)
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF00A8E8)
    ),

    body: Center (child: 
    Text(learn, 
    style: TextStyle(
      color: Color.fromARGB(255, 0, 183, 255), 
      fontWeight: FontWeight.bold, 
      fontSize: 50),
      ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF00A8E8),
        selectedLabelStyle: TextStyle(color: Color(0xFF00A8E8)),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Color(0xFF00A8E8)), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information'),
      ],
      ),
    );

  }
}
