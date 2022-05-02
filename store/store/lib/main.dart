import 'package:flutter/material.dart';
import 'package:store/pages/cartpage.dart';
import 'package:store/pages/homepage.dart';
import 'package:store/pages/loginpage.dart';
import 'package:store/utils/store_routes.dart';
import 'package:store/widgets/appthemes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: StoreTheme.lightTheme(context),
        initialRoute: StoreRoutes.loginRoute,
        routes: {
          "/": (context) => LoginPage(),
          StoreRoutes.homeRoute: (context) => HomePage(),
          StoreRoutes.loginRoute: (context) => LoginPage(),
          StoreRoutes.cartRoute: (context) => CartPage(),
        });
  }
}
