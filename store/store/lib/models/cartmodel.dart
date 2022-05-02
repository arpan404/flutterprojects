import 'package:store/models/storemodel.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();
  factory CartModel() => cartModel;

  late StoreModel _storelog;
  final List<int> _itemIds = [];
  StoreModel get storelog => _storelog;
  set storelog(StoreModel newStorelog) {
    assert(newStorelog != null);
    _storelog = newStorelog;
  }

  List<Item> get items => _itemIds.map((id) => _storelog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
