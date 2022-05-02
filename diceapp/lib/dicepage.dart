import "package:flutter/material.dart";
import 'dart:math';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  num img = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice App"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
                padding: EdgeInsets.all(100),
                child: Image.asset(
                  "images/$img.png",
                )),
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  img = Random().nextInt(6);
                  print(img);
                  setState(() {});
                },
                child: Text("Roll")),
          ),
        ],
      ),
    );
  }
}
