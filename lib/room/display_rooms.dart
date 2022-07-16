import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/room/status_selection.dart';

class DisplayRooms extends StatefulWidget {
  const DisplayRooms({Key? key}) : super(key: key);

  @override
  _DisplayRoomsState createState() => _DisplayRoomsState();
}

class _DisplayRoomsState extends State<DisplayRooms> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Rooms')
      .where("status", isEqualTo: "unassigned")
      .where("clean_status", isEqualTo: "dirty")
      .snapshots();
  String department = '';
  String manager_uid = "";
  String manager_name = "";

  @override
  void initState() {
    // TODO: implement initState
    final a = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('User').doc(a).get().then((value) {
      setState(() {
        department = value.get('Dept');
        manager_uid = a;
        manager_name = value.get("Username");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unassigned Rooms'),
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) {
                                  //     return AssignDepartments(
                                  //       send: AssignedAGM(),
                                  //       uId: data['Uid'],
                                  //     );
                                  //   }),
                                  // );
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
                                                  2.2,
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
                                                        'Room : ${data['RoomNo']}',
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
                                                      'Cleaning Status : ${data['clean_status']}',
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
                                                      'Dirty Status: ${data['dirty_type']}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    //margin: EdgeInsets.only(left: 5),
                                                    child: Text(
                                                      'Employee : ${data['emp_name']}',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,

                                                        //color: Colors.lightGreen
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
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
                                                            3.92,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          StatusSelection(
                                                                            department:
                                                                                department,
                                                                            requestUid:
                                                                                document.id,
                                                                            manager_uid:
                                                                                manager_uid,
                                                                            manager_name:
                                                                                manager_name,
                                                                          )));
                                                        },
                                                        child: Text('Assign'),
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .lightGreen),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
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
                                              ],
                                            ),
                                            // SizedBox(
                                            //   width: context
                                            //       .read<DetailScreenProvider>()
                                            //       .cart_screen_icon(
                                            //           MediaQuery.of(context).size.height),
                                            // ),
                                            // Container(
                                            //   alignment: Alignment.centerRight,
                                            //   child: Icon(
                                            //     Icons.delete_forever,
                                            //     color: Colors.lightGreen,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      )
                                    : Container(child: Text("")),
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
