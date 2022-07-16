import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/auth_screens/register.dart';

String tit = "";

class Categories extends StatelessWidget {
  String category = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF080848),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 26,
            ),
          ),
          title: Text(
            tit,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 10.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          category = "GM";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register("", category)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          height: 120,
                          // width: 130,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/general manager.png',
                                    width: 50,
                                    color: Color(0xffAE8BFF),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'General Manager',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 25.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          category = "AGM";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register("", category)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          height: 120,
                          // width: 130,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/Assitant manager.png',
                                    width: 50,
                                    color: Color(0xffFB7F56),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Assistant General Manager',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 10.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          category = "HKM";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register("HouseKeeping", category)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          height: 120,
                          // width: 130,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/housekeeping.png',
                                    width: 50,
                                    color: Color(0xffFD6AC0),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'HouseKeeping Manager',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 25.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          category = "EM";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register("ENG", category)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          height: 120,
                          // width: 130,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/Engineering.png',
                                    width: 55,
                                    color: Color(0xffFE9D58),
                                  ),
                                  Text(
                                    'Engineering Manager',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 10.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          category = "FBM";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register("Food", category)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          height: 120,
                          // width: 130,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/foods manager.png',
                                    width: 50,
                                    color: Color(0xff5C88FF),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Food & Beverage Manager',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 25.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          category = "SM";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register("", category)),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          height: 120,
                          // width: 130,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/sales manager.png',
                                    width: 55,
                                    color: Color(0xffFCC831),
                                  ),
                                  Text(
                                    'Sales Manager',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 10.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        // onTap: () {
                        //   category = "Sales Manager";
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Register("", category)),
                        //   );
                        // },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          height: 120,
                          // width: 130,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/departments.png',
                                    width: 50,
                                    color: Color(0xffA46BFF),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Departments',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 25.0, top: 20.0, bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        height: 120,
                        // width: 130,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/rooms.jpg',
                                  width: 55,
                                  color: Color(0xffF8537F),
                                ),
                                Text(
                                  ' Rooms',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
