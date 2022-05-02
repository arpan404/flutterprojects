import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/models/cartmodel.dart';
import 'package:store/pages/productpage.dart';
import 'package:store/utils/store_routes.dart';
import 'package:store/widgets/appdrawer.dart';
import 'package:store/models/storemodel.dart';
import 'package:store/widgets/appthemes.dart';
import 'package:store/widgets/itemwidget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 0));
    var productJson = await rootBundle.loadString("files/products.json");
    var decodedData = jsonDecode(productJson);
    var productData = decodedData["products"];
    StoreModel.items = List.from(productData)
        .map<Item>((item) => Item.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, StoreRoutes.cartRoute);
        },
        backgroundColor: Colors.blue,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HomePageHeader(), StoreProductList().py16().expand()],
          ),
        ),
      ),
    );
  }
}

class StoreProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: StoreModel.items.length,
        itemBuilder: (context, index) {
          final storelog = StoreModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(storelog: storelog))),
              child: StoreItem(storelog: storelog));
        });
  }
}

class StoreItem extends StatelessWidget {
  final Item storelog;

  const StoreItem({Key? key, required this.storelog})
      : assert(storelog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(storelog.id.toString()),
              child: Image.network(storelog.itemImgUrl)
                  .box
                  .p4
                  .make()
                  .w40(context)),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                storelog.name.text.lg.bold.blueGray600.make(),
                storelog.description.text.blueGray500.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${storelog.price}"
                        .text
                        .fontWeight(FontWeight.w800)
                        .blueGray800
                        .lg
                        .make(),
                    _AddToCart(storelog: storelog)
                  ],
                ).pOnly(right: 4).pOnly(top: 10),
              ]))
        ],
      ),
    ).white.rounded.square(140).make().py12();
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

class HomePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      "Store".text.xl6.bold.blueGray500.make(),
      "By Apple".text.xl.gray600.make(),
    ]);
  }
}
