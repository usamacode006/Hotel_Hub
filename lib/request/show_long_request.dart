import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/notes_page.dart';
import 'package:hotel_hub/request/assign_manager.dart';
import 'package:hotel_hub/request/employ_list.dart';

class LongRequests extends StatefulWidget {
  const LongRequests({Key? key}) : super(key: key);

  @override
  _LongRequestsState createState() => _LongRequestsState();
}

class _LongRequestsState extends State<LongRequests> {
  Color color = Colors.pink[300]!;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('LongTermRequest')
      .where("status", isEqualTo: "accepted")
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Long Task List'),
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
                                    //Dialogbox
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) {
                                    //     return AlertDialog(
                                    //       backgroundColor: Colors.indigo[300]!,
                                    //       title: Text(
                                    //         data["title"],
                                    //         style: TextStyle(
                                    //           fontSize: 20.00,
                                    //           color: Colors.black,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //       ),
                                    //       content: Container(
                                    //         height: 220,
                                    //         width: 200,
                                    //         child: Column(
                                    //           crossAxisAlignment:
                                    //               CrossAxisAlignment.start,
                                    //           children: [
                                    //             Text(
                                    //               '${data["title"]}',
                                    //               style: TextStyle(
                                    //                 fontSize: 16.00,
                                    //                 color: Colors.white,
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 10,
                                    //             ),
                                    //             Text(
                                    //               "Short Desc: ${data["description"]}",
                                    //               style: TextStyle(
                                    //                 fontSize: 16.00,
                                    //                 color: Colors.white,
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 10,
                                    //             ),
                                    //             Text(
                                    //               "Long Desc: ${data["long_desc"]}",
                                    //               style: TextStyle(
                                    //                 fontSize: 16.00,
                                    //                 color: Colors.white,
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 10,
                                    //             ),
                                    //             Text(
                                    //               "Accepted By: ${data["manag_Name"]}",
                                    //               style: TextStyle(
                                    //                 fontSize: 16.00,
                                    //                 color: Colors.white,
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 10,
                                    //             ),
                                    //             Text(
                                    //               "Assigned To: ${data["emp_Name"]}",
                                    //               style: TextStyle(
                                    //                 fontSize: 16.00,
                                    //                 color: Colors.white,
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //       actions: [
                                    //         TextButton(
                                    //           style: TextButton.styleFrom(
                                    //             primary: Colors.red,
                                    //             backgroundColor: Colors.red,
                                    //           ),
                                    //           child: Text(
                                    //             "OK",
                                    //             style: TextStyle(
                                    //                 color: Colors.white),
                                    //           ),
                                    //           onPressed: () {
                                    //             Navigator.pop(context);
                                    //           },
                                    //         ),
                                    //       ],
                                    //     );
                                    //   },
                                    // );
                                    //end dialog box
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> Employees(department: department, requestUid: requestUid, manager_uid: manager_uid, manager_name: manager_name)))
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AssignManager(
                                                uId: document.id)));
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Container(
                                            //   color: makeColor(data["color"]),
                                            //   width: 3.5,
                                            //   height: double.infinity,
                                            // ),
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
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: double.infinity,
                                                        child: AutoSizeText(
                                                          ("Manager Assigned : ${data["manag_Name"]}"),
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
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       right: 8.0),
                                            //   child: InkWell(
                                            //     onTap: () {
                                            //       FirebaseFirestore.instance
                                            //           .collection(
                                            //               'LongTermRequest')
                                            //           .doc(document.id)
                                            //           .update({
                                            //         "status": "accepted",
                                            //       }).then((value) => print(
                                            //               'Request Accepted'));
                                            //     },
                                            //     child: Container(
                                            //       decoration: BoxDecoration(
                                            //           border: Border.all(
                                            //         color: Colors.black54,
                                            //         width: 2,
                                            //       )),
                                            //       child: Padding(
                                            //         padding: const EdgeInsets
                                            //                 .symmetric(
                                            //             horizontal: 15.0,
                                            //             vertical: 8),
                                            //         child: Text('Accept'),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
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
