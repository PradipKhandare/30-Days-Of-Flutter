import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = 'Pradip';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Pradips Tech'),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to the $days days of flutter by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
