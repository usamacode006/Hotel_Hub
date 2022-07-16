import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/auth_screens/login.dart';
import 'package:hotel_hub/house_keeping_manager/add_meeting.dart';
import 'package:hotel_hub/house_keeping_manager/display_meeting.dart';
import 'package:hotel_hub/navigation_bar/navigationbar_provider.dart';
import 'package:hotel_hub/request/assigned_request.dart';
import 'package:hotel_hub/request/create_long_term.dart';
import 'package:hotel_hub/request/create_request.dart';
import 'package:hotel_hub/request/request.dart';
import 'package:hotel_hub/request/show_long_request.dart';
import 'package:hotel_hub/room/display_rooms.dart';
import 'package:hotel_hub/room/display_rooms_for_event.dart';
import 'package:provider/provider.dart';

class HKMHomePage extends StatelessWidget {
  const HKMHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = FirebaseAuth.instance.currentUser!.uid;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 26,
          ),
        ),
        title: Text(
          "HouseKeeping Manager",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //MyHeaderDrawer(),
                Container(
                  color: Colors.teal,
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/male.png'),
                          ),
                        ),
                      ),
                      Text(
                        "HKM Ali",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "info@ali.dev",
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateRequest()),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'images/accept request.png',
                                  width: 20,
                                  height: 25,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Create Short Request',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisplayRooms()),
                            );
                          },
                          child: Row(
                            children: const [
                              Expanded(
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Assign Employ',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddMeeting(),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Expanded(
                                child: Icon(
                                  Icons.calendar_today,
                                  size: 20,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Add Meeting',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayMeeting(),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Expanded(
                                child: Icon(
                                  Icons.emoji_events,
                                  size: 20,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Show Meeting',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.logout,
                                size: 20,
                                color: Colors.teal,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF080848),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('User')
                .doc(a)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              return Column(
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
                              // context.read<NavProvider>().onItemTapped(1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateRequest()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image.asset(
                                      //   'images/general manager.png',
                                      //   width: 50,
                                      //   color: Color(0xffAE8BFF),
                                      // ),
                                      Image.asset(
                                        'images/accept request.png',
                                        width: 50,
                                        color: Color(0xffAE8BFF),
                                      ),
                                      // Icon(
                                      //   Icons.add_r,
                                      //   size: 50,
                                      //   color: Color(0xffAE8BFF),
                                      // ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Create Short Request',
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
                              // context.read<NavProvider>().onItemTapped(1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Request()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/list.png',
                                        width: 50,
                                        color: Color(0xffEB5031),
                                      ),
                                      // Icon(
                                      //   Icons.list_alt,
                                      //   size: 50,
                                      //   color: Color(0xffFB7F56),
                                      // ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Show Short Requests',
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
                              // context.read<NavProvider>().onItemTapped(1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LongTermRequest(
                                    uid: a,
                                    managerName: snapshot.data!.get('Username'),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/accept request.png',
                                        width: 50,
                                        color: Color(0xffFD6AC0),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Create Long Requests',
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
                              // context.read<NavProvider>().onItemTapped(1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LongRequests(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/list.png',
                                        width: 50,
                                        color: Color(0xffFF9043),
                                      ),
                                      Text(
                                        'Show Long Requests',
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
                              // context.read<NavProvider>().onItemTapped(1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayRooms()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/Assitant manager.png',
                                        width: 50,
                                        color: Color(0xff5C88FF),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Assign Employs   To Rooms',
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
                              // context.read<NavProvider>().onItemTapped(1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DisplayRoomsForEvent(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'images/rooms.jpg',
                                        width: 55,
                                        color: Color(0xffFCC831),
                                      ),
                                      Text(
                                        'Show All Rooms',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddMeeting(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              height: 120,
                              // width: 130,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.meeting_room,
                                      size: 50,
                                      color: Color(0xffA46BFF),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Add Meeting',
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 25.0, top: 20.0, bottom: 10.0),
                          child: InkWell(
                            onTap: () {
                              // context.read<NavProvider>().onItemTapped(1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DisplayMeeting(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              height: 120,
                              // width: 130,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    // Image.asset(
                                    //   'images/rooms.jpg',
                                    //   width: 55,
                                    //   color: Color(0xffF8537F),
                                    // ),
                                    Icon(
                                      Icons.meeting_room_rounded,
                                      size: 50,
                                      color: Color(0xffF8537F),
                                    ),
                                    Text(
                                      'Show Meetings',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 10.0, top: 20.0, bottom: 10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayShortList()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              height: 120,
                              // width: 130,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.list_alt,
                                      size: 50,
                                      color: Color(0xffA46BFF),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Display Short List',
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 25.0, top: 20.0, bottom: 10.0),
                          child: InkWell(
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              height: 120,
                              // width: 130,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.logout,
                                      size: 50,
                                      color: Color(0xffF8537F),
                                    ),
                                    Text(
                                      'Log Out',
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
                  // StreamBuilder<DocumentSnapshot>(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('User')
                  //         .doc(a)
                  //         .snapshots(),
                  //     builder:
                  //         (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  //       return Center(
                  //         child: Container(
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Center(
                  //                   child:
                  //                       Text('HouseKeeping Manager Home Page')),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   await FirebaseAuth.instance.signOut();
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) => Login()),
                  //                   );
                  //                 },
                  //                 child: Text('Sign out'),
                  //               ),
                  //               SizedBox(
                  //                 height: 10,
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) =>
                  //                             CreateRequest()),
                  //                   );
                  //                 },
                  //                 child: Text('Create short Request'),
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                       builder: (context) => LongTermRequest(
                  //                         uid: a,
                  //                         managerName:
                  //                             snapshot.data!.get('Username'),
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //                 child: Text('Create long Request'),
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                       builder: (context) => LongRequests(),
                  //                     ),
                  //                   );
                  //                 },
                  //                 child: Text('show long Request'),
                  //               ),
                  //               SizedBox(
                  //                 height: 10,
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) => Request()),
                  //                   );
                  //                 },
                  //                 child: Text('Show short Request'),
                  //               ),
                  //               SizedBox(
                  //                 height: 10,
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) =>
                  //                             DisplayShortList()),
                  //                   );
                  //                 },
                  //                 child: Text('Short List'),
                  //               ),
                  //               SizedBox(
                  //                 height: 10,
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) => DisplayRooms()),
                  //                   );
                  //                 },
                  //                 child: Text('Assign Employ To Rooms'),
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                       builder: (context) =>
                  //                           DisplayRoomsForEvent(),
                  //                     ),
                  //                   );
                  //                 },
                  //                 child: Text('All Rooms'),
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                       builder: (context) => AddMeeting(),
                  //                     ),
                  //                   );
                  //                 },
                  //                 child: Text('Add Meeting'),
                  //               ),
                  //               ElevatedButton(
                  //                 onPressed: () async {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                       builder: (context) => DisplayMeeting(),
                  //                     ),
                  //                   );
                  //                 },
                  //                 child: Text('Display Meeting'),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     }),
                ],
              );
            }),
      ),
      bottomNavigationBar: HKMHomeNavBar(),
    );
  }
}

class HKMHomeNavBar extends StatefulWidget {
  const HKMHomeNavBar({Key? key}) : super(key: key);

  @override
  _HKMHomeNavBarState createState() => _HKMHomeNavBarState();
}

class _HKMHomeNavBarState extends State<HKMHomeNavBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                //color: Colors.lightGreen,
                color: Color(0xFFF1F3F4),
                boxShadow: const [
                  BoxShadow(offset: Offset(0, -1), blurRadius: 1),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: notifier.selectedIndex == 0
                              ? Colors.redAccent
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          // setBottomBarIndex(0);
                          context.read<NavProvider>().onItemTapped(0);
                          context
                              .read<NavProvider>()
                              .HKMHomePageNavBar(context);
                        },
                        splashColor: Colors.white,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: notifier.selectedIndex == 0
                              ? Colors.redAccent
                              : Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => Column(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.list_alt_outlined,
                            color: notifier.selectedIndex == 1
                                ? Colors.redAccent
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            //setBottomBarIndex(1);
                            context.read<NavProvider>().onItemTapped(1);
                            context
                                .read<NavProvider>()
                                .HKMHomePageNavBar(context);
                          }),
                      Text(
                        'Short List',
                        style: TextStyle(
                          color: notifier.selectedIndex == 1
                              ? Colors.redAccent
                              : Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                // Container(
                //   width: size.width * 0.20,
                // ),
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.request_page_outlined,
                          color: notifier.selectedIndex == 2
                              ? Colors.redAccent
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          //setBottomBarIndex(2);
                          context.read<NavProvider>().onItemTapped(2);
                          context
                              .read<NavProvider>()
                              .HKMHomePageNavBar(context);
                        },
                      ),
                      Text(
                        'Create Request',
                        style: TextStyle(
                          color: notifier.selectedIndex == 2
                              ? Colors.redAccent
                              : Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => Column(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.request_page_outlined,
                            color: notifier.selectedIndex == 3
                                ? Colors.redAccent
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            //setBottomBarIndex(3);
                            context.read<NavProvider>().onItemTapped(3);
                            context
                                .read<NavProvider>()
                                .HKMHomePageNavBar(context);
                          }),
                      Text(
                        'Show Request',
                        style: TextStyle(
                          color: notifier.selectedIndex == 3
                              ? Colors.redAccent
                              : Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
