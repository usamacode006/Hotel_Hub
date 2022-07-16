import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/navigation_bar/bottom_nav_bar_agm.dart';
import 'package:hotel_hub/request/employ_list.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Request')
      .where("status", isEqualTo: "unassigned")
      .snapshots();
  String department = '';
  String manager_uid = "";
  String manager_name = "";

  @override
  void initState() {
    // TODO: implement initState
    FirebaseFirestore.instance
        .collection('User')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        department = value.get('Dept');
        manager_uid = value.get("Uid");
        manager_name = value.get("Username");
        print("department of manager is $department");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
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
                                  // FirebaseFirestore.instance
                                  //     .collection('User')
                                  //     .doc(FirebaseAuth.instance.currentUser!.uid)
                                  //     .get()
                                  //     .then((value) {
                                  //   setState(() {
                                  //     department = value.get('Dept');
                                  //
                                  //   });
                                  // });
                                  // print("department of manager is $department");
                                },
                                child: Card(
                                  color: Color(0xFFF4F5FC),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.lightGreen, width: 1),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.6,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 0, 0, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 20, 0, 0),
                                                child: Container(
                                                  //margin: EdgeInsets.only(right: 120),
                                                  child: Text(
                                                    'Title : ${data['title']}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.lightGreen),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                //margin: EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Description : ${data['description']}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
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
                                                  'Status : ${data['status']}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                //margin: EdgeInsets.only(left: 2),
                                                child: Text(
                                                  'Employ : ${data['employ']}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blueAccent,
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
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(right: 20),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 35,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Employees(
                                                              department:
                                                                  department,
                                                              requestUid:
                                                                  document.id,
                                                              manager_uid:
                                                                  manager_uid,
                                                              manager_name:
                                                                  manager_name,
                                                            )),
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  child: Text('Accept'),
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 5,
                                            // ),
                                            // SizedBox(
                                            //   height: 35,
                                            //   child: ElevatedButton(
                                            //     onPressed: () {},
                                            //     child: Padding(
                                            //       padding:
                                            //           const EdgeInsets.fromLTRB(
                                            //               10, 0, 10, 0),
                                            //       child: Text('Decline'),
                                            //     ),
                                            //     style: ButtonStyle(
                                            //       backgroundColor:
                                            //           MaterialStateProperty.all(
                                            //               Colors.redAccent),
                                            //       shape:
                                            //           MaterialStateProperty.all<
                                            //               RoundedRectangleBorder>(
                                            //         RoundedRectangleBorder(
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   18.0),
                                            //           side: BorderSide(
                                            //               color: Colors.white),
                                            //         ),
                                            //       ),
                                            //     ),
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
                                ),
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
      // bottomNavigationBar: BottomNavBarAGM(),
    );
  }
}
