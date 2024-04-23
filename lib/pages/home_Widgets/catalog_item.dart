// ignore_for_file: public_member_api_docs, sort_constructors_first
//CatalogItem
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:thirty_days_of_flutter/main.dart';
import 'package:thirty_days_of_flutter/models/cart.dart';
import 'package:thirty_days_of_flutter/models/catalog.dart';
import 'package:thirty_days_of_flutter/pages/home_Widgets/catalog_image.dart';
import 'package:thirty_days_of_flutter/pages/home_page.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyApp.darkBluesh).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyApp.darkBluesh),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isAdded
            ? const Icon(Icons.done)
            : "Add to Cart".text.color(Colors.white).make());
  }
}
