import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_hub/request/employ_list.dart';

class DisplayInventory extends StatefulWidget {
  const DisplayInventory({Key? key}) : super(key: key);

  @override
  _DisplayInventoryState createState() => _DisplayInventoryState();
}

class _DisplayInventoryState extends State<DisplayInventory> {
  String choose = '';
  int numberOfItem = 1;
  List<String> img = [
    "images/towel.jpg",
    "images/bedsheet.jpg",
    "images/soap.jpg",
    "images/food.jpg",
  ];

  List<String> title = ["Towel", "Bedsheet", "Soap", "Food"];
  final inventory =
      FirebaseFirestore.instance.collection('Inventory').snapshots();
  String department = '';
  String AssignBy_uid = "";
  String AssignBy_name = "";

  @override
  void initState() {
    // TODO: implement initState
    final a = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('User').doc(a).get().then((value) {
      setState(() {
        department = value.get('Dept');
        AssignBy_uid = a;
        AssignBy_name = value.get("Username");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: inventory,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return GridView(
              shrinkWrap: true,
              padding: EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                var assignToRooms = data['assignToRoom'];
                var laundry = data['laundry'];
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Color activeColor = Colors.white;
                        Color inactiveColor = Colors.white;
                        return AlertDialog(
                          content: StatefulBuilder(
                            // You need this, notice the parameters below:
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return SizedBox(
                                height: 490,
                                width: 800,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // setState(() {
                                        //   activeColor =
                                        //       Colors.deepPurple;
                                        //   inactiveColor =
                                        //       Colors.white;
                                        //   payment_Method =
                                        //   "JazzCash";
                                        // });
                                      },
                                      child: Container(
                                        color: activeColor,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              data['Image'].toString(),
                                              height: 180,
                                              width: 150,
                                              fit: BoxFit.contain,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Name : ${document.id}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    wordSpacing: 10),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 7,
                                            // ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Storage : ${data['Storage']}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    wordSpacing: 2),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 7,
                                            // ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Assigned : ${data['Assign']}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    wordSpacing: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Rooms : ${data['rooms']}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    wordSpacing: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Per : ${data['per']}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    wordSpacing: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "2Per : ${data['2per']}",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    wordSpacing: 12),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.redAccent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        if (assignToRooms > 0) {
                                                          setState(() {
                                                            assignToRooms--;
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons.minus,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Assign To Rooms : $assignToRooms ",
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      //   wordSpacing: 12,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.redAccent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          assignToRooms++;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons.plus,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.redAccent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        if (laundry > 0) {
                                                          setState(() {
                                                            laundry--;
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons.minus,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Laundry : $laundry",
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      //   wordSpacing: 12,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.redAccent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          laundry++;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons.plus,
                                                        size: 20,
                                                        color: Colors.white,
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.red,
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    "Send Email",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: StatefulBuilder(
                                              // You need this, notice the parameters below:
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 290,
                                                  width: 500,
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            activeColor = Colors
                                                                .deepPurple;
                                                            inactiveColor =
                                                                Colors.white;
                                                            choose = "room";
                                                          });
                                                        },
                                                        child: Card(
                                                          child: Container(
                                                            color: activeColor,
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  'images/rooms.jpg',
                                                                  height: 100,
                                                                  width: 80,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  "Assign To Room",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            inactiveColor =
                                                                Colors
                                                                    .deepPurple;
                                                            activeColor =
                                                                Colors.white;
                                                            choose = "employ";
                                                          });
                                                        },
                                                        child: Card(
                                                          child: Container(
                                                            color:
                                                                inactiveColor,
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  'images/sec.png',
                                                                  height: 100,
                                                                  width: 80,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text(
                                                                  "Assign To Employee",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            child: IconButton(
                                                              onPressed: () {
                                                                if (numberOfItem >
                                                                    1) {
                                                                  setState(() {
                                                                    numberOfItem--;
                                                                  });
                                                                }
                                                              },
                                                              icon: Icon(
                                                                CupertinoIcons
                                                                    .minus,
                                                                color: Colors
                                                                    .white,
                                                                size: 25,
                                                              ),
                                                              //color: Colors.blue,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Card(
                                                              child: Text(
                                                                '${numberOfItem}',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  numberOfItem++;
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 25,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            actions: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.red,
                                                  backgroundColor: Colors.red,
                                                ),
                                                child: Text(
                                                  "Proceed",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  if (choose == "employ") {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Employees(
                                                          department:
                                                              'Housekeeping',
                                                          requestUid:
                                                              document.id,
                                                          manager_uid:
                                                              AssignBy_uid,
                                                          manager_name:
                                                              AssignBy_name,
                                                        ),
                                                      ),
                                                    ).whenComplete(() =>
                                                        Navigator.pop(context));
                                                  } else if (choose == "room") {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           PaymentUI()),
                                                    // );
                                                  } else {
                                                    // EasyLoading.show(
                                                    //     status:
                                                    //         "Creating request");
                                                    // await updateValue();
                                                  }

                                                  //print("$a"); //causing the issue neeed to solve
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.red,
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    "Proceed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: StatefulBuilder(
                                              // You need this, notice the parameters below:
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Container(
                                                  height: 290,
                                                  width: 500,
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            activeColor = Colors
                                                                .deepPurple;
                                                            inactiveColor =
                                                                Colors.white;
                                                            choose = "room";
                                                          });
                                                        },
                                                        child: Card(
                                                          child: Container(
                                                            color: activeColor,
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  'images/rooms.jpg',
                                                                  height: 100,
                                                                  width: 80,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  "Assign To Room",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            inactiveColor =
                                                                Colors
                                                                    .deepPurple;
                                                            activeColor =
                                                                Colors.white;
                                                            choose = "employ";
                                                          });
                                                        },
                                                        child: Card(
                                                          child: Container(
                                                            color:
                                                                inactiveColor,
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  'images/sec.png',
                                                                  height: 100,
                                                                  width: 80,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text(
                                                                  "Assign To Employee",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            child: IconButton(
                                                              onPressed: () {
                                                                if (numberOfItem >
                                                                    1) {
                                                                  setState(() {
                                                                    numberOfItem--;
                                                                  });
                                                                }
                                                              },
                                                              icon: Icon(
                                                                CupertinoIcons
                                                                    .minus,
                                                                color: Colors
                                                                    .white,
                                                                size: 25,
                                                              ),
                                                              //color: Colors.blue,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Card(
                                                              child: Text(
                                                                '${numberOfItem}',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  numberOfItem++;
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 25,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            actions: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.red,
                                                  backgroundColor: Colors.red,
                                                ),
                                                child: Text(
                                                  "Proceed",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  if (choose == "employ") {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Employees(
                                                          department:
                                                              'Housekeeping',
                                                          requestUid:
                                                              document.id,
                                                          manager_uid:
                                                              AssignBy_uid,
                                                          manager_name:
                                                              AssignBy_name,
                                                        ),
                                                      ),
                                                    ).whenComplete(() =>
                                                        Navigator.pop(context));
                                                  } else if (choose == "room") {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           PaymentUI()),
                                                    // );
                                                  } else {
                                                    // EasyLoading.show(
                                                    //     status:
                                                    //         "Creating request");
                                                    // await updateValue();
                                                  }

                                                  //print("$a"); //causing the issue neeed to solve
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: GridTile(
                    child: Image.network(
                      data['Image'].toString(),
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : 1.2,
                          ),
                        );
                      },
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black54,
                      title: Text(
                        document.id,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
