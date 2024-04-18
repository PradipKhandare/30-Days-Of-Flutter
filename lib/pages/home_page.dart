import 'package:flutter/material.dart';
import 'package:thirty_days_of_flutter/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = 'Pradip';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pradips Tech',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          child: Text("welcome to the $days days of flutter by $name"),
        ),
      ),
    );
  }
}
