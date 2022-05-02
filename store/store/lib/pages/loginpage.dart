import 'package:flutter/material.dart';
import 'package:store/utils/store_routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usrname = "";
  bool isloginBtnClicked = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isloginBtnClicked = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, StoreRoutes.homeRoute);
      setState(() {
        isloginBtnClicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "images/login_page_img.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "$usrname",
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 209, 86),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your username",
                        labelText: "Username",
                      ),
                      onChanged: (value) {
                        if (value != "") {
                          usrname = "Welcome " + value;
                        } else {
                          usrname = "";
                        }
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Username cannot be empty";
                        } else if (value != null && value.length < 4) {
                          return "Username is too short";
                        } else if (value != null && value.length > 18) {
                          return "Username is too long";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "What's your password?",
                        labelText: "Password",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value != null && value.length < 8) {
                          return "Password should be at least 8 character long";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: isloginBtnClicked
                    ? Color.fromARGB(255, 75, 228, 80)
                    : Colors.blue,
                borderRadius: BorderRadius.circular(isloginBtnClicked ? 25 : 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: isloginBtnClicked ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: isloginBtnClicked
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 40,
                          )
                        : Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
