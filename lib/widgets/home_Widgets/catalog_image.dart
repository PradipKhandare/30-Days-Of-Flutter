//CatalogImage
import 'package:flutter/material.dart';
import 'package:thirty_days_of_flutter/main.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  })  : assert(image != null),
        super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyApp.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
