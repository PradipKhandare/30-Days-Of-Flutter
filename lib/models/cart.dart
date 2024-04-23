import 'package:thirty_days_of_flutter/models/catalog.dart';

class CartModel {
  //catalog field
  CatalogModel _catalog;

//collection of IDs.
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//Get items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

      //Add item
    void add(Item item){
      _itemIds.add(item.id);
    }

      //Remove item
      void remove(Item item){
        _itemIds.remove(item.id);
      }
}
