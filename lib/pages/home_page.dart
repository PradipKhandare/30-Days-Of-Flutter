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
        backgroundColor: Colors.blue,
        title: const Text(
          'Pradips Tech',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Text("welcome to the $days days of flutter by $name"),
      ),
    );
  }
}
