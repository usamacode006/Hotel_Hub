import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/assigned_general_manager.dart';

class AssignDepartments extends StatefulWidget {
  final Widget send;
  final String uId;
  const AssignDepartments({required this.send, required this.uId});

  @override
  _AssignDepartmentsState createState() => _AssignDepartmentsState();
}

class _AssignDepartmentsState extends State<AssignDepartments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 200,
          floating: true,
          pinned: true,

          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
//           actions: [
//             Icon(Icons.settings),
//             SizedBox(width: 12),
//
// ]
        ),
        buildImages(context),
      ]),
    );
  }

  Widget buildImages(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height / 1.366,
            // width: MediaQuery
            //     .of(context)
            //     .size
            //     .width / 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                //color: Colors.lightGreen,
                color: Color(0xFFF1F3F4),
                boxShadow: const [
                  BoxShadow(offset: Offset(0, -10), blurRadius: 25),
                ]),
            child: SingleChildScrollView(
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
                              //category="House Keeping Manager";
                              //var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Status": "assigned",
                                "Dept": "Housekeeping",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        'HouseKeeping Department',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
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
                              //var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Status": "assigned",
                                "Dept": "Engineering",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/Engineering.png',
                                        width: 55,
                                        color: Color(0xffFE9D58),
                                      ),
                                      Text(
                                        'Engineering Department',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
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
                              var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Dept": "Food",
                                "Status": "assigned",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        'Food & Beverage Department',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
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
                              //var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Dept": "Sales",
                                "Status": "assigned",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/sales manager.png',
                                        width: 55,
                                        color: Color(0xffFCC831),
                                      ),
                                      Text(
                                        'Sales Department',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
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
                              //var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Dept": "Front Desk",
                                "Status": "assigned",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        'Front Desk Department',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
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
                              //var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Dept": "Security",
                                "Status": "assigned",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              height: 125,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/security.jpg',
                                        width: 55,
                                        //color: Color(0xffF8537F),
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        'Security Department',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
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
                              //var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Dept": "other",
                                "Status": "assigned",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        'Other Departments',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
                                          fontSize: 16,
                                          letterSpacing: 2,
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
                              //var a = FirebaseAuth.instance.currentUser!.uid;
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(widget.uId)
                                  .update({
                                "Dept": "Custom",
                                "Status": "assigned",
                              }).then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => widget.send),
                                      ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/other.png',
                                        width: 50,
                                        color: Color(0xffFB7F56),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Custom Name Department',
                                        style: TextStyle(
                                          color: Color(0xFF080848),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
