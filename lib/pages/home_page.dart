import 'package:flutter/material.dart';
import 'package:thirty_days_of_flutter/models/catalog.dart';
import 'package:thirty_days_of_flutter/widgets/drawer.dart';
import 'package:thirty_days_of_flutter/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = 'Pradip';
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Pradips Tech',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              //itemCount: CatalogModel.items.length,
              itemCount: dummyList.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  //item: CatalogModel.items[index],
                  item: dummyList[index],
                );
              }),
        ));
  }
}
