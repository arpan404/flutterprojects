import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var listTodo = [];
  bool isNoadd = false;
  bool isCross = false;
  bool isInput = false;

  TextEditingController _todo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
      ),
      floatingActionButton: isInput
          ? FloatingActionButton(
              onPressed: () {
                var todoData = _todo.text;
                if (todoData != "" && todoData != " ") {
                  isInput = false;
                  isNoadd = false;
                  listTodo.add(todoData);
                  _todo.clear();
                } else {
                  null;
                }
                setState(() {});
              },
              child: Icon(CupertinoIcons.paperplane),
            )
          : FloatingActionButton(
              child: !isCross
                  ? Icon(CupertinoIcons.add)
                  : Icon(CupertinoIcons.xmark),
              onPressed: () {
                if (isCross == true) {
                  isNoadd = false;
                  isCross = false;
                } else {
                  isNoadd = true;
                  isCross = false;
                }

                setState(() {});
              },
            ),
      body: !isNoadd
          ? Container(
              child: ListView.builder(
              itemCount: listTodo.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      listTodo[index],
                      style: TextStyle(fontSize: 25),
                    ),
                    trailing: Column(children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.xmark,
                          size: 30,
                        ),
                        onPressed: () {
                          listTodo.removeAt(index);
                          if (listTodo.length == 0) {
                            isNoadd = false;
                          }
                          setState(() {});
                        },
                      ),
                    ]),
                  ),
                );
              },
            ))
          : Center(
              child: Container(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _todo,
                    onChanged: (value) {
                      if (value != "" || value != " ") {
                        isCross = false;
                        isInput = true;
                      } else if (value == "" || value == " ") {
                        isCross = true;
                        isInput = false;
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: "Add a To Do",
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
