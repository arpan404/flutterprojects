import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imgUrl =
        "https://cdn.dribbble.com/users/1577045/screenshots/4914645/media/5146d1dbf9146c4d12a7249e72065a58.png";
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Arpan Bhandari"),
              accountEmail: Text("arpanmail@mail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white),
            title: Text("Home",
                textScaleFactor: 1.6,
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          ListTile(
            leading:
                Icon(CupertinoIcons.person_crop_circle, color: Colors.white),
            title: Text("Profile",
                textScaleFactor: 1.6,
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.rectangle_3_offgrid_fill,
                color: Colors.white),
            title: Text("Products",
                textScaleFactor: 1.6,
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
