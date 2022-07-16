import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/assigned_general_manager.dart';
import 'package:hotel_hub/admin/assign_departments.dart';
import 'package:hotel_hub/navigation_bar/bottom_nav_bar_gm.dart';

class UnassignedGeneralManager extends StatefulWidget {
  const UnassignedGeneralManager({Key? key}) : super(key: key);

  @override
  _UnassignedGeneralManagerState createState() =>
      _UnassignedGeneralManagerState();
}

class _UnassignedGeneralManagerState extends State<UnassignedGeneralManager> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('User')
      .where("Role", isEqualTo: "GM")
      .where("Dept", isEqualTo: "unassigned")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unassigned GM'),
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
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return AssignDepartments(
                                        send: AssignedGM(),
                                        uId: data['Uid'],
                                      );
                                    }),
                                  );
                                },
                                child: data["Image"] != "default"
                                    ? Card(
                                        color: Color(0xFFF4F5FC),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.lightGreen,
                                              width: 1),
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                '${data['Image']}',
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.6,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 20, 0, 0),
                                                    child: Container(
                                                      //margin: EdgeInsets.only(right: 120),
                                                      child: Text(
                                                        '${data['Username']}',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .lightGreen),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    //margin: EdgeInsets.only(left: 5),
                                                    child: Text(
                                                      'Role : ${data['Role']}',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,

                                                        //color: Colors.lightGreen
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    //margin: EdgeInsets.only(left: 2),
                                                    child: Text(
                                                      '${data['Dept']}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: context
                                            //       .read<DetailScreenProvider>()
                                            //       .cart_screen_icon(
                                            //       MediaQuery.of(context).size.height/4.7),
                                            // ),
                                            // SizedBox(
                                            //     width:10
                                            // ),
                                            Container(
                                              // margin: EdgeInsets.only(right: 20),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              20.76,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.22,
                                                      child: ElevatedButton(
                                                          onPressed: () {},
                                                          child:
                                                              Text('Available'),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all(
                                                                      Colors
                                                                          .lightGreen),
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          18.0),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .white))))),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  // SizedBox(
                                                  //   height: 30,
                                                  //
                                                  //   child: ElevatedButton(
                                                  //
                                                  //
                                                  //       onPressed: () {  },
                                                  //       child: Text('Decline'),
                                                  //       style: ButtonStyle(
                                                  //           backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                                                  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  //               RoundedRectangleBorder(
                                                  //                   borderRadius: BorderRadius.circular(18.0),
                                                  //                   side: BorderSide(color: Colors.white)
                                                  //               )
                                                  //           )
                                                  //       )
                                                  //
                                                  //   ),
                                                  // ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  // SizedBox(
                                                  //   height: 20,
                                                  // )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(child: Text("Hello")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBarGm(),
    );
  }
}
