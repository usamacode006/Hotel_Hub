import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/gm_home_page.dart';
import 'package:hotel_hub/GeneralManager/gm_profile.dart';
import 'package:hotel_hub/admin/admin_categories.dart';
import 'package:hotel_hub/admin/categories.dart';
import 'package:hotel_hub/assitant_general_manager/agm_profile.dart';
import 'package:hotel_hub/engineering_manager/em_profile.dart';
import 'package:hotel_hub/firebase_auth/authentication_service.dart';
import 'package:hotel_hub/food_and_beverage_manager/fbm_profile.dart';
import 'package:hotel_hub/house_keeping_manager/hkm_profile.dart';
import 'package:hotel_hub/sales_manager/sm_profile.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/src/provider.dart';

import '../palette.dart';
import 'login.dart';

String dept = "";
String rol = "";

class Register extends StatefulWidget {
  Register(String depart, String role) {
    dept = depart;
    rol = role;
  }

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: " Hotel Hub",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Signup to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button

          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: 200,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 400,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //isSignupScreen = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            });
                          },
                          child: Column(
                            children: const [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.activeColor),
                              ),
                              // // if (!isSignupScreen)
                              // Container(
                              //   margin: EdgeInsets.only(top: 3),
                              //   height: 2,
                              //   width: 55,
                              //   color: Colors.orange,
                              // )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // isSignupScreen = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories()),
                              );
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.activeColor),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // if (isSignupScreen) buildSignupSection(),
                    // if (!isSignupScreen) buildSigninSection()
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                hintText: "User Name",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                hintText: "aa@gmail.com",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                hintText: "******",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Text(
                                      "Role : ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Palette.activeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    rol,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Palette.activeColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              // TextButton(
                              //   onPressed: () {},
                              //   child: Text("Forgot Password?",
                              //       style: TextStyle(fontSize: 12, color: Palette.textColor1)),
                              // )
                            ],
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 90,
                              width: 90,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      spreadRadius: 1.5,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: const [
                                          Colors.orange,
                                          Colors.red
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.3),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 1))
                                    ]),
                                child: InkWell(
                                  onTap: () async {
                                    var a = await context.read<AuthenticationService>().signUp(
                                      userName: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      role: rol,
                                      phone: "",
                                      dept: dept,
                                      context: context
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
