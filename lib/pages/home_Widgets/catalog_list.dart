//CatalogList
import 'package:flutter/material.dart';
import 'package:thirty_days_of_flutter/models/catalog.dart';
import 'package:thirty_days_of_flutter/pages/home_Widgets/catalog_item.dart';
import 'package:thirty_days_of_flutter/pages/home_detail_page.dart';

import 'package:thirty_days_of_flutter/pages/home_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: ((context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailsPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      }),
    );
  }
}
