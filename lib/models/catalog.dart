class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "HP Laptop 15s",
        desc:
            "4-core AMD Ryzen 3 5300 8 threads and 4MB L3 cache deliver powerful performance",
        price: 34990,
        color: "#EC3440",
        image:
            "https://cdn.ttgtmedia.com/rms/onlineimages/hp_elitebook_mobile.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
