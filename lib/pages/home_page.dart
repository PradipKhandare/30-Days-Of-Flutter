// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thirty_days_of_flutter/Utils/routes.dart';
import 'package:thirty_days_of_flutter/pages/home_Widgets/catalog_header.dart';
import 'package:thirty_days_of_flutter/pages/home_Widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:thirty_days_of_flutter/main.dart';
import 'package:thirty_days_of_flutter/models/catalog.dart';
import 'package:thirty_days_of_flutter/widgets/drawer.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyApp.creamColor,
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: MyApp.darkBluesh,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            )),
        drawer: const MyDrawer(),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
