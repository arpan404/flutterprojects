import 'package:flutter/material.dart';
import 'package:profileapp/profile.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Profile(),
      },
    );
  }
}
