import 'package:flutter/material.dart';

class submitpage extends StatelessWidget{
  final String name;
  final String id;
  final String email;

  const submitpage({Key? key,required this.name,required this.id, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit page'),
                titleTextStyle: const TextStyle(color:Color.fromARGB(255, 255, 255, 255),

      ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name:$name'),
            Text('ID:$id'),
            Text('Email: $email'),
          ],
      ),
    )
    );
  }
}