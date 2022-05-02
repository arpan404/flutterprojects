import 'package:flutter/material.dart';
import 'package:store/models/storemodel.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.itemImgUrl),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\$" + item.price.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
