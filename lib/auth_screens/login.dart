import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/admin/admin_categories.dart';
import 'package:hotel_hub/admin/categories.dart';
import 'package:hotel_hub/auth_screens/register.dart';
import 'package:hotel_hub/firebase_auth/authentication_service.dart';
import 'package:hotel_hub/firebase_auth/user_vs_worker.dart';
import 'package:provider/src/provider.dart';

import '../palette.dart';
import 'choose_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final FirebaseAuth _firebaseAuth;
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
                      "Signin to Continue",
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
            top: 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 350,
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
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.activeColor),
                              ),
                              // if (!isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )
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
                            children: const [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.activeColor),
                              ),
                              // Container(
                              //   margin: EdgeInsets.only(top: 3),
                              //   height: 2,
                              //   width: 55,
                              //   color: Colors.orange,
                              // )
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
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 150, 0),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor1,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () async {
                                final a = await context.read<AuthenticationService>().signIn(
                                    email: emailController.text,
                                    password: passwordController.text,
                                context: context
                                );
                                if (a == 'Signed in') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChooseScreen()),
                                  );
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
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
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         // Checkbox(
                          //         //   value: isRememberMe,
                          //         //   activeColor: Palette.textColor2,
                          //         //   onChanged: (value) {
                          //         //     setState(() {
                          //         //       //isRememberMe = !isRememberMe;
                          //         //     });
                          //         //   },
                          //         // ),
                          //         // Text("Remember me",
                          //         //     style: TextStyle(fontSize: 12, color: Palette.textColor1))
                          //       ],
                          //     ),
                          //     TextButton(
                          //       onPressed: () {},
                          //       child: Text("Forgot Password?",
                          //           style: TextStyle(fontSize: 12, color: Palette.textColor1)),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    )
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
