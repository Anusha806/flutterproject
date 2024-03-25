import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:later/submitpage.dart';
import 'package:postgres/postgres.dart';
import 'package:later/database_setup.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class ChatPage extends StatefulWidget {
  @override
  _ChatpageState createState() => _ChatpageState();
}

class HelpPage extends StatefulWidget {
  @override
  _HelppageState createState() => _HelppageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>(); // key to validate the form's input
  String _name = '';
  String _id = '';
  String _email = '';
  int _currentIndex = 0;

Database_setup database_setup =Database_setup(
  host: 'localhost', 
  port: 5432, 
  databasename: 'flutter', 
  username: 'postgres', 
  password: 'admin',
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_1280.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('This is my Homepage'),
            titleTextStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            backgroundColor: Colors.transparent, // Make the app bar transparent
          ),
          body: Center(
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white, // Set container background color
              ),
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'ID',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _id = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the text';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => submitpage(
                                name: _name,
                                id: _id,
                                email: _email,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent, // Make the scaffold transparent
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.grey,
  currentIndex: _currentIndex, // Add this line
  items: const [
    // BottomNavigationBarItem(
    //   label: "Home",
    //   icon: Icon(Icons.home),
    // ),
    BottomNavigationBarItem(
      label: "Chat",
      icon: Icon(Icons.chat_outlined),
    ),
    BottomNavigationBarItem(
      label: "Help",
      icon: Icon(Icons.help),
    ),
    BottomNavigationBarItem(
      label: "Profile",
      icon: Icon(Icons.account_circle_rounded),
    ),
  ],
  onTap: (int itemIndex){
    if(itemIndex == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
      setState(() {
        _currentIndex = itemIndex; // Update _currentIndex
      });
    } 
    else if(itemIndex == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatPage()),
      );
      setState(() {
        _currentIndex = itemIndex;
      });
    }
    else if(itemIndex == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HelpPage()),
      );
      setState(() {
        _currentIndex = itemIndex;
      });
    }
    else {
      setState(() {
        _currentIndex = itemIndex;
      });
    }
  }
          ),
        ),
      ],
    );
  }
}

class _ProfilepageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Center(
        child: Text("This is my Profile Page"),
      ),
    );
  }
}

class _ChatpageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EnquirePage"),
      ),
      body: Center(
        child: Text("This is my Enquire Page"),
      ),
    );
  }
}

class _HelppageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelpPage"),
      ),
      body: Center(
        child: Text("This is my Help Page"),
      ),
    );
  }
}