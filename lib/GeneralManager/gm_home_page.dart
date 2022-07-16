import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/Employee/employee_signup.dart';
import 'package:hotel_hub/admin/add_employee.dart';
import 'package:hotel_hub/admin/add_event.dart';
import 'package:hotel_hub/admin/display_events.dart';
import 'package:hotel_hub/admin/send_notifications.dart';
import 'package:hotel_hub/auth_screens/login.dart';
import 'package:hotel_hub/inventory/show_inventory.dart';
import 'package:hotel_hub/navigation_bar/navigationbar_provider.dart';
import 'package:hotel_hub/request/assigned_long_request.dart';
import 'package:hotel_hub/request/assigned_request.dart';
import 'package:hotel_hub/request/show_long_request.dart';
import 'package:provider/provider.dart';

class GMHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GMHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                        "GM Ali",
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
                                  color: Colors.teal,
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
                                  builder: (context) => const EmployeeSignUp()),
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
                                  'Add Employee',
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
                                  builder: (context) => const AddEvent()),
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
                                  'Add Event',
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
                                  builder: (context) => const DisplayEvents()),
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
                                  'Show Events',
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
                                  color: Colors.teal,
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
          "General Manager",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal,
      body: Column(
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
                            builder: (context) => DisplayShortList()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      height: 120,
                      // width: 130,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/list.png',
                              width: 50,
                              color: Color(0xff8252FF),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Show Short Requests List',
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
                        MaterialPageRoute(builder: (context) => LongRequests()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      height: 120,
                      // width: 130,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/list.png',
                              width: 50,
                              color: Color(0xffFB7F56),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Show Long Requests List',
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
                      // category = "General Manager";
                      context.read<NavProvider>().onItemTapped(1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayLongRequest()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      height: 120,
                      // width: 130,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/accept request.png',
                              width: 50,
                              color: Color(0xffFC3CB0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Accept Long Requests',
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
                        MaterialPageRoute(builder: (context) => AddEmployee()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      height: 120,
                      // width: 130,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.person,
                              size: 60,
                              color: Color(0xffFF9043),
                            ),
                            // Image.asset(
                            //   'images/Engineering.png',
                            //   width: 55,
                            //   color: Color(0xffFE9D58),
                            // ),
                            Text(
                              'Add Employee',
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
                      context.read<NavProvider>().onItemTapped(1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddEvent()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      height: 120,
                      // width: 130,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.event,
                              size: 60,
                              color: Color(0xff386BFF),
                            ),
                            // Image.asset(
                            //   'images/foods manager.png',
                            //   width: 50,
                            //   color: Color(0xff5C88FF),
                            // ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Add Event',
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
                            builder: (context) => DisplayEvents()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      height: 120,
                      // width: 130,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.event_available_rounded,
                              size: 60,
                              color: Color(0xffFFC716),
                            ),
                            // Image.asset(
                            //   'images/sales manager.png',
                            //   width: 55,
                            //   color: Color(0xffFCC831),
                            // ),
                            Text(
                              'Show Event',
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
      bottomNavigationBar: GMHomeNavBar(),
    );
  }
}

class GMHomeNavBar extends StatefulWidget {
  const GMHomeNavBar({Key? key}) : super(key: key);

  @override
  _GMHomeNavBarState createState() => _GMHomeNavBarState();
}

class _GMHomeNavBarState extends State<GMHomeNavBar> {
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
                              ? Colors.teal
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          // setBottomBarIndex(0);
                          context.read<NavProvider>().onItemTapped(0);
                          context.read<NavProvider>().GMHomePageNavBar(context);
                        },
                        splashColor: Colors.white,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: notifier.selectedIndex == 0
                              ? Colors.teal
                              : Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
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
                                ? Colors.teal
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            //setBottomBarIndex(1);
                            context.read<NavProvider>().onItemTapped(1);
                            context
                                .read<NavProvider>()
                                .GMHomePageNavBar(context);
                          }),
                      Text(
                        'Short List',
                        style: TextStyle(
                          color: notifier.selectedIndex == 1
                              ? Colors.teal
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
                            Icons.list_alt_outlined,
                            color: notifier.selectedIndex == 2
                                ? Colors.teal
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            //setBottomBarIndex(2);
                            context.read<NavProvider>().onItemTapped(2);
                            context
                                .read<NavProvider>()
                                .GMHomePageNavBar(context);
                          }),
                      Text(
                        'Long List',
                        style: TextStyle(
                          color: notifier.selectedIndex == 2
                              ? Colors.teal
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
                            Icons.logout,
                            color: notifier.selectedIndex == 3
                                ? Colors.teal
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            //setBottomBarIndex(3);
                            context.read<NavProvider>().onItemTapped(3);
                            context
                                .read<NavProvider>()
                                .GMHomePageNavBar(context);
                          }),
                      Text(
                        'LogOut',
                        style: TextStyle(
                          color: notifier.selectedIndex == 3
                              ? Colors.teal
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
