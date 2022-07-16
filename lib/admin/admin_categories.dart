import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/Employee/employee_signup.dart';
import 'package:hotel_hub/GeneralManager/unassigned_gm.dart';
import 'package:hotel_hub/admin/add_employee.dart';
import 'package:hotel_hub/admin/add_event.dart';
import 'package:hotel_hub/admin/display_events.dart';
import 'package:hotel_hub/admin/send_notifications.dart';
import 'package:hotel_hub/assitant_general_manager/unassigned_agm.dart';
import 'package:hotel_hub/auth_screens/login.dart';
import 'package:hotel_hub/engineering_manager/unassigned_em.dart';
import 'package:hotel_hub/food_and_beverage_manager/unassigned_fbm.dart';
import 'package:hotel_hub/house_keeping_manager/unassigned_hkm.dart';
import 'package:hotel_hub/inventory/show_inventory.dart';
import 'package:hotel_hub/navigation_bar/navigationbar_provider.dart';
import 'package:hotel_hub/room/add_room.dart';
import 'package:hotel_hub/sales_manager/unassigned_sm.dart';
import 'package:provider/src/provider.dart';

import '../palette.dart';

class AdminCategories extends StatefulWidget {
  const AdminCategories({Key? key}) : super(key: key);

  @override
  _AdminCategoriesState createState() => _AdminCategoriesState();
}

class _AdminCategoriesState extends State<AdminCategories> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController perController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  //MyHeaderDrawer(),
                  Container(
                    color: Colors.green[700],
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
                          "Admin Hamza",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          "info@hamza.dev",
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
                                    builder: (context) =>
                                        const SendNotifications()),
                              );
                            },
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Icon(
                                    Icons.circle_notifications_outlined,
                                    size: 20,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Send Notifications',
                                    style: TextStyle(
                                        color: Colors.purple,
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
                                    builder: (context) =>
                                        const EmployeeSignUp()),
                              );
                            },
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Icon(
                                    Icons.person,
                                    size: 20,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Add Employee',
                                    style: TextStyle(
                                        color: Colors.orange,
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
                                    builder: (context) => const AddEvent()),
                              );
                            },
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Icon(
                                    Icons.calendar_today,
                                    size: 20,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Add Event',
                                    style: TextStyle(
                                        color: Colors.lightGreen,
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
                                    builder: (context) =>
                                        const DisplayEvents()),
                              );
                            },
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Icon(
                                    Icons.emoji_events,
                                    size: 20,
                                    color: Colors.purple,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Show Events',
                                    style: TextStyle(
                                        color: Colors.redAccent,
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
                                    builder: (context) =>
                                        const DisplayInventory()),
                              );
                            },
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Icon(
                                    Icons.inventory,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Inventory',
                                    style: TextStyle(
                                        color: Colors.cyan,
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
                                        color: Colors.red,
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
            "Admin",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                          // category = "General Manager";
                          context.read<NavProvider>().onItemTapped(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UnassignedGeneralManager()),
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
                          context.read<NavProvider>().onItemTapped(1);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UnassignedAGM()),
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
                          // category = "General Manager";
                          context.read<NavProvider>().onItemTapped(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UnassignedHKM()),
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
                          context.read<NavProvider>().onItemTapped(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UnassignedEM()),
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
                          context.read<NavProvider>().onItemTapped(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UnassignedFBM()),
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
                          context.read<NavProvider>().onItemTapped(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UnassignedSM()),
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 25.0, top: 20.0, bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          context.read<NavProvider>().onItemTapped(1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadRoom()),
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
