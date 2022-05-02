import "package:flutter/material.dart";
import 'package:store/models/cartmodel.dart';
import "package:velocity_x/velocity_x.dart";
import "package:store/models/storemodel.dart";
import 'package:flutter/cupertino.dart';

class ProductPage extends StatelessWidget {
  final Item storelog;
  const ProductPage({Key? key, required this.storelog})
      : assert(storelog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${storelog.price}"
                  .text
                  .fontWeight(FontWeight.w800)
                  .blueGray800
                  .xl3
                  .make(),
              _AddToCart(storelog: storelog).w20(context)
            ],
          ).pOnly(right: 4).pOnly(top: 20).pOnly(bottom: 30).pOnly(left: 20),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Hero(
                        tag: Key(storelog.id.toString()),
                        child: Image.network(storelog.itemImgUrl))
                    .h40(context),
                Expanded(
                    child: VxArc(
                  height: 20.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(children: [
                      storelog.name.text.bold.xl3.blueGray700.make(),
                      storelog.description.text.xl.blueGray600
                          .make()
                          .p4()
                          .expand(),
                    ]).p32(),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}

class _AddToCart extends StatefulWidget {
  final Item storelog;
  const _AddToCart({
    Key? key,
    required this.storelog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isIncart = _cart.items.contains(widget.storelog);
    return ElevatedButton(
        onPressed: () {
          if (isIncart != true) {
            final _storelog = StoreModel();
            _cart.storelog = _storelog;
            _cart.add(widget.storelog);
          }
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
        child: !isIncart
            ? Icon(CupertinoIcons.cart_badge_plus)
            : Icon(Icons.done));
  }
}
