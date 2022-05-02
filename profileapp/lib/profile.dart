import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile App"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: 300,
                    child: Image.asset("images/profile.jpg"))),
            Text(
              "Arpan Bhandari",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Address: Gulmi, Nepal",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  "Email: arpanworkmail7@gmail.com",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: Text(
                  "Develop by Arpan Bhandari",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
