import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thirty_days_of_flutter/models/catalog.dart';
import 'package:thirty_days_of_flutter/widgets/drawer.dart';
import 'package:thirty_days_of_flutter/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int days = 30;
  String name = 'Pradip';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(productsData);
  }

  @override
  Widget build(BuildContext context) {
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
