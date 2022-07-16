import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/notes_page.dart';
import 'dart:math';

class DisplayShortList extends StatefulWidget {
  const DisplayShortList({Key? key}) : super(key: key);

  @override
  _DisplayShortListState createState() => _DisplayShortListState();
}

class _DisplayShortListState extends State<DisplayShortList> {
  @override
  String manager_name = "";
  String emp_name = "";
  Color color = Colors.pink[300]!;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Request')
      .where("status", isEqualTo: "in work")
      .snapshots();

  @override
  void initState() {
    // TODO: implement initState
    Random random = new Random();
    int randomNumber = random.nextInt(10);
    setState(() {
      color = noteMarginColor[randomNumber];
    });

    print("Color is $color");
    super.initState();
  }

  makeColor(String color) {
    String valueString = color.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    Color otherColor = new Color(value);
    return otherColor;
  }

  getManagerUid(String manId) async {
    var collection = FirebaseFirestore.instance.collection('User');
    var docSnapshot = await collection.doc(manId).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      manager_name = data?['Username'];
      print("manager name is $emp_name");
      // <-- The value you want to retrieve.
      // Call setState if needed.
    }
    return manager_name;
  }

  getEmployeeUid(String empId) {
    // var collection = FirebaseFirestore.instance.collection('Employee');
    // var docSnapshot =
    //     await collection.doc(empId).get();
    // if (docSnapshot.exists) {
    //   Map<String, dynamic>? data = docSnapshot.data();
    //   emp_name = data?['Name'];
    //   // <-- The value you want to retrieve.
    //   // Call setState if needed.
    //   print("employeee name is $emp_name");
    // }
    // return emp_name;
    print("emp id is $empId");
    FirebaseFirestore.instance
        .collection('Employee')
        .doc(empId)
        .get()
        .then((value) {
      emp_name = value.get("Name");
    });
    return emp_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Task List'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return SingleChildScrollView(
              child: ListView(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // var a= await getManagerUid(data["manager_uid"]);
                                    // print("manager_uid is ${data["manager_uid"]}");
                                    // var b=await getEmployeeUid(data["emp_uid"]);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.indigo[300]!,
                                          title: Text(
                                            data["title"],
                                            style: TextStyle(
                                              fontSize: 20.00,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: Container(
                                            height: 220,
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${data["title"]}',
                                                  style: TextStyle(
                                                    fontSize: 16.00,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Short Desc: ${data["description"]}",
                                                  style: TextStyle(
                                                    fontSize: 16.00,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Long Desc: ${data["long_desc"]}",
                                                  style: TextStyle(
                                                    fontSize: 16.00,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Accepted By: ${data["manag_Name"]}",
                                                  style: TextStyle(
                                                    fontSize: 16.00,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Assigned To: ${data["emp_Name"]}",
                                                  style: TextStyle(
                                                    fontSize: 16.00,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                primary: Colors.red,
                                                backgroundColor: Colors.red,
                                              ),
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.5),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: makeColor(data["color"]),
                                        borderRadius:
                                            BorderRadius.circular(5.5),
                                      ),
                                      height: 100,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Container(
                                              color: makeColor(data["color"]),
                                              width: 3.5,
                                              height: double.infinity,
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        data["title"],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 20.00,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.5,
                                                    ),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: double.infinity,
                                                        child: AutoSizeText(
                                                          (data["description"]),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 15.00,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: double.infinity,
                                                        child: AutoSizeText(
                                                          ("Worker Assigned : ${data["emp_Name"]}"),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 15.00,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
                  );
                }).toList(),
              ),
            );
          }),
      // bottomNavigationBar: BottomNavBarAGM(),
    );
  }
}
