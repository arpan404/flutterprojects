import 'dart:math';
import 'package:flutter/material.dart';
import 'package:store/models/cartmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Cart",
        style: TextStyle(
          color: Colors.blue,
        ),
        textScaleFactor: 1.8,
      )),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatefulWidget {
  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cart.items.isEmpty
              ? "".text.make()
              : "\$${_cart.totalPrice}".text.xl3.blueGray800.make(),
          30.widthBox,
          _cart.items.isEmpty
              ? "".text.make()
              : ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Buying option is not available yet"),
                    ));
                  },
                  child: "Check Out".text.xl.bold.make())
        ],
      ).pOnly(left: 10).pOnly(right: 20),
    );
  }
}

class CartList extends StatefulWidget {
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "You have nothing in cart".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline_rounded),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      setState(() {});
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
