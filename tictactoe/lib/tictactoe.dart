import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var gameList = ["", "", "", "", "", "", "", "", ""];
  bool canPlay = true;
  bool isWon = false;

  var appBarTitle = Text("Your Turn...",
      textScaleFactor: 3,
      style: TextStyle(
        color: Colors.green[400],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 3,
                  crossAxisCount: 3,
                ),
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(0) == false && canPlay == true) {
                          gameList.removeAt(0);
                          gameList.insert(0, "X");
                          canPlay = false;
                          aiPlay();
                        }
                        setState(() {
                          build(context);
                        });
                      },
                      child: Container(
                        color: isClicked(0) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[0]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(1) == false && canPlay == true) {
                          gameList.removeAt(1);
                          gameList.insert(1, "X");
                          canPlay = false;
                          aiPlay();
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(1) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[1]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(2) == false && canPlay == true) {
                          gameList.removeAt(2);
                          gameList.insert(2, "X");
                          canPlay = false;
                          aiPlay();
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(2) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[2]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(3) == false && canPlay == true) {
                          gameList.removeAt(3);
                          gameList.insert(3, "X");
                          canPlay = false;
                          aiPlay();
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(3) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[3]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(4) == false && canPlay == true) {
                          gameList.removeAt(4);
                          gameList.insert(4, "X");
                          canPlay = false;
                          aiPlay();
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(4) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[4]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(5) == false && canPlay == true) {
                          gameList.removeAt(5);
                          gameList.insert(5, "X");
                          canPlay = false;
                          aiPlay();
                        }

                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(5) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[5]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(6) == false && canPlay == true) {
                          gameList.removeAt(6);
                          gameList.insert(6, "X");
                          canPlay = false;
                          aiPlay();
                        }

                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(6) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[6]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(7) == false && canPlay == true) {
                          gameList.removeAt(7);
                          gameList.insert(7, "X");
                          canPlay = false;
                          aiPlay();
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(7) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[7]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        if (isClicked(8) == false && canPlay == true) {
                          gameList.removeAt(8);
                          gameList.insert(8, "X");
                          canPlay = false;

                          aiPlay();
                        }
                        setState(() {});
                      },
                      child: Container(
                        color: isClicked(8) ? Colors.blue : Colors.black54,
                        child: Center(
                          child: Text(
                            "${gameList[8]}",
                            style: TextStyle(fontSize: 80, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(),
            Visibility(
              visible: isWon,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => GamePage()));
                },
                child: Visibility(
                  visible: isWon,
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Play Again❕",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
      ),
    );
  }

  isClicked(index) {
    if (gameList[index].length == 1) {
      return true;
    } else {
      return false;
    }
  }

  aiPlay() {
    setState(() {
      build(context);
      appBarTitle = Text("My Turn...",
          textScaleFactor: 3,
          style: TextStyle(
            color: Colors.green[400],
          ));
    });
    if (checkWinner() == false) {
      Future.delayed(Duration(milliseconds: 3000), () => (aiTurn()));
    } else {
      winnerHuman();
    }
  }

  aiTurn() {
    canPlay = true;
    aiTurnPlaying();
    if (checkWinner() == false) {
      setState(() {
        build(context);
        appBarTitle = Text("Your Turn...",
            textScaleFactor: 3,
            style: TextStyle(
              color: Colors.green[400],
            ));
      });
    } else {
      winnerMe();
    }
  }

  winnerHuman() {
    setState(() {
      build(context);
      appBarTitle = Text("You Won👻",
          textScaleFactor: 3,
          style: TextStyle(
            color: Colors.green[400],
          ));
      isWon = true;
    });
  }

  winnerMe() {
    setState(() {
      build(context);
      appBarTitle = Text("I Won✌🏻",
          textScaleFactor: 3,
          style: TextStyle(
            color: Colors.green[400],
          ));
      isWon = true;
    });
  }

  checkWinner() {
    if (((gameList[0] == gameList[1] && gameList[0] == gameList[2]) &&
            (gameList[0].length == 1 &&
                gameList[1].length == 1 &&
                gameList[2].length == 1)) ||
        ((gameList[3] == gameList[4] && gameList[3] == gameList[5]) &&
            (gameList[3].length == 1 &&
                gameList[4].length == 1 &&
                gameList[5].length == 1)) ||
        ((gameList[6] == gameList[7] && gameList[6] == gameList[8]) &&
            (gameList[6].length == 1 &&
                gameList[7].length == 1 &&
                gameList[8].length == 1)) ||
        ((gameList[2] == gameList[5] && gameList[2] == gameList[8]) &&
            (gameList[2].length == 1 &&
                gameList[5].length == 1 &&
                gameList[8].length == 1)) ||
        ((gameList[0] == gameList[3] && gameList[0] == gameList[6]) &&
            (gameList[0].length == 1 &&
                gameList[3].length == 1 &&
                gameList[6].length == 1)) ||
        ((gameList[1] == gameList[4] && gameList[1] == gameList[7]) &&
            (gameList[4].length == 1 &&
                gameList[1].length == 1 &&
                gameList[7].length == 1)) ||
        ((gameList[0] == gameList[4] && gameList[0] == gameList[8]) &&
            (gameList[0].length == 1 &&
                gameList[4].length == 1 &&
                gameList[8].length == 1)) ||
        ((gameList[6] == gameList[4] && gameList[6] == gameList[2]) &&
            (gameList[6].length == 1 &&
                gameList[4].length == 1 &&
                gameList[2].length == 1))) {
      return true;
    } else {
      return false;
    }
  }

  aiTurnPlaying() {
    int i = 0;
    while (true) {
      if (gameList[i].length == 0) {
        gameList.removeAt(i);
        gameList.insert(i, "O");
        setState(() {});
        break;
      } else {
        i += 1;
      }
    }
  }
}
