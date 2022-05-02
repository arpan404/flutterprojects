import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  num score = 0;
  bool isNumNegative = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Score App")),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "The Score is",
                textScaleFactor: 2,
                style: TextStyle(
                  color: isNumNegative ? Colors.red[400] : Colors.green[400],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              child: Text(
                "$score",
                textScaleFactor: 6,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: isNumNegative ? Colors.red : Colors.green,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                padding: EdgeInsets.fromLTRB(50, 150, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      score -= 1;
                      if (score < 0) {
                        isNumNegative = true;
                      } else {
                        isNumNegative = false;
                      }
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[400],
                    ),
                    child: Icon(
                      Icons.exposure_minus_1,
                      size: 50,
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 150, 50, 0),
                child: ElevatedButton(
                    onPressed: () {
                      score += 1;
                      setState(() {});
                      if (score < 0) {
                        isNumNegative = true;
                      } else {
                        isNumNegative = false;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[400],
                    ),
                    child: Icon(
                      Icons.plus_one,
                      size: 50,
                    )),
              ),
            ]),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: ElevatedButton(
                  onPressed: () {
                    score = 0;
                    setState(() {});
                    if (score < 0) {
                      isNumNegative = true;
                    } else {
                      isNumNegative = false;
                    }
                  },
                  child: Icon(
                    Icons.restore,
                    size: 40,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
