class StoreModel {
  static final storeModel = StoreModel._internal();

  StoreModel._internal();
  factory StoreModel() => storeModel;
  static List<Item> items = [];
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPos(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String itemImgUrl;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.itemImgUrl});
  factory Item.fromJson(Map<String, dynamic> map) => Item(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      price: map["price"],
      color: map["color"],
      itemImgUrl: map["itemImgUrl"]);
}
