import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/request/request.dart';

String department1 = "";
String request1 = "";
String manage = "";
String mang_name = "";
int numberOfItems = 1;

class Employees extends StatefulWidget {
  final String department;
  final String requestUid;
  final String manager_uid;
  final String manager_name;
  int numberOfItem;

  // AssignBy_uid
  // AssignBy_name
  // employ_uid
  // emp_name
  // assignedby_department
  // status
  Employees({
    required this.department,
    required this.requestUid,
    required this.manager_uid,
    required this.manager_name,
    this.numberOfItem = 1,
  }) {
    department1 = department;
    request1 = requestUid;
    manage = manager_uid;
    mang_name = manager_name;
    numberOfItems = numberOfItem;
  }

  @override
  _EmployeesState createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  //var Department;
  List<String> docNames = [];
  final inventory = FirebaseFirestore.instance.collection('Inventory');
  bool findName = false;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Employee')
      .where("Dept", isEqualTo: department1)
      .snapshots();

  @override
  void initState() {
    // TODO: implement initState
    print(inventory.doc().get());
    inventory.snapshots().forEach((element) {
      element.docs.forEach((element) {
        print(element.id);
        if (element.id == widget.requestUid) {
          findName = true;
        }
      });
    });
    super.initState();
  }

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
                  print(data);
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    final update =
                                        inventory.doc(widget.requestUid);
                                    print(widget.requestUid);
                                    if (findName == true) {
                                      //FirebaseAuth.instance.currentUser!.uid;
                                      FirebaseFirestore.instance
                                          .collection('Employee')
                                          .doc(document.id)
                                          .update({
                                        "status": "assigned",
                                      }).then((value) =>
                                              print("successfully done"));
                                      //print("uid of employee isss ${data["uid"]}");
                                      var storage, assign;
                                      update.get().then((value) {
                                        storage = value.get('Storage');
                                        assign = value.get('Assign');
                                      }).then((value) {
                                        update.update({
                                          'Assign': (assign + numberOfItems),
                                          'Storage': (storage - numberOfItems),
                                        }).then((value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Value Updated'),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        });
                                      });
                                    } else {
                                      FirebaseAuth.instance.currentUser!.uid;
                                      FirebaseFirestore.instance
                                          .collection('Employee')
                                          .doc(data["uid"])
                                          .update({
                                        "status": "assigned",
                                      }).then((value) =>
                                              print("successfully done"));
                                      //print("uid of employee isss ${data["uid"]}");
                                      FirebaseFirestore.instance
                                          .collection('Request')
                                          .doc(widget.requestUid)
                                          .update({
                                        "status": "in work",
                                        'department': department1,
                                        "manager_uid": manage,
                                        "emp_uid": data["uid"],
                                        "emp_Name": data["Name"],
                                        "manag_Name": mang_name
                                      }).then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('Value Updated'),
                                          ),
                                        );
                                        Navigator.pop(context);
                                      });
                                    }
                                  },
                                  child: data["status"] == "unassigned"
                                      ? Card(
                                          color: Color(0xFFF4F5FC),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.lightGreen,
                                                width: 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    '${data['Image']}',
                                                    height: 90,
                                                    width: 90,
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
                                                        CrossAxisAlignment
                                                            .start,
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
