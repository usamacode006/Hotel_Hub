import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/request/create_long_term.dart';

String department1 = "";
String request1 = "";
String manage = "";
String mang_name = "";
String clean_statuss = "";
String dirty_typee = "";

class AssignEmployToRoom extends StatefulWidget {
  final String department;
  final String requestUid;
  final String manager_uid;
  final String manager_name;
  final String clean_status;
  final String dirty_type;

  AssignEmployToRoom({
    required this.department,
    required this.requestUid,
    required this.manager_uid,
    required this.manager_name,
    required this.clean_status,
    required this.dirty_type,
  }) {
    department1 = department;
    request1 = requestUid;
    manage = manager_uid;
    mang_name = manager_name;
    clean_statuss = clean_status;
    dirty_typee = dirty_type;
  }

  @override
  _AssignEmployToRoomState createState() => _AssignEmployToRoomState();
}

class _AssignEmployToRoomState extends State<AssignEmployToRoom> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Employee')
      .where("Dept", isEqualTo: '$department1')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Text('${department1} Employees'),
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
                                    if (clean_statuss == 'Dirty') {
                                      clean_statuss = 'dirty';
                                    }
                                    final uid =
                                        FirebaseAuth.instance.currentUser!.uid;
                                    FirebaseFirestore.instance
                                        .collection('Employee')
                                        .doc(document.id)
                                        .update({
                                      "status": "assigned",
                                    }).then((value) =>
                                            print("successfully done"));
                                    //print("uid of employee isss ${data["uid"]}");
                                    FirebaseFirestore.instance
                                        .collection('Rooms')
                                        .doc(widget.requestUid)
                                        .update({
                                      "status": "in work",
                                      "emp_uid": document.id,
                                      "emp_Name": data["Name"],
                                      "manag_Name": mang_name,
                                      'manager_uid': uid,
                                      'dirty_type': dirty_typee,
                                      'clean_status': clean_statuss,
                                    }).then((value) => Navigator.pop(context));
                                  },
                                  child: data["status"] == "unassigned"
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
                                                    1.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 5, 0, 0),
                                                      child: Container(
                                                        //margin: EdgeInsets.only(right: 120),
                                                        child: Text(
                                                          'Name : ${data['Name']}',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                        'Dept : ${data['Dept']}',
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
                                                        'Status : ${data['status']}',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // margin: EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: const [
                                                    SizedBox(
                                                      height: 5,
                                                    ),

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
                                      : Container()),
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
