import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_hub/room/status_selection.dart';

class DisplayRoomsForEvent extends StatefulWidget {
  const DisplayRoomsForEvent({Key? key}) : super(key: key);

  @override
  _DisplayRoomsForEventState createState() => _DisplayRoomsForEventState();
}

class _DisplayRoomsForEventState extends State<DisplayRoomsForEvent> {
  TextEditingController noteController = TextEditingController();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Rooms').snapshots();
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
        title: Text('All Rooms'),
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
                                  noteController.text = data['note'];
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      Color activeColor = Colors.white;
                                      Color inactiveColor = Colors.white;
                                      return AlertDialog(
                                        content: StatefulBuilder(
                                          // You need this, notice the parameters below:
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return SizedBox(
                                              height: 250,
                                              width: 800,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      color: activeColor,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        5.0,
                                                                    horizontal:
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  noteController,
                                                              maxLines: 8,
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      // fontWeight: FontWeight.bold,
                                                                      color: Colors
                                                                          .black),
                                                              decoration:
                                                                  InputDecoration(
                                                                // fillColor: Colors
                                                                //     .blue[200]!
                                                                //     .withOpacity(
                                                                //         0.4),
                                                                // filled: true,
                                                                //hoverColor: kDarkBlue,
                                                                // helperText: 'Add Text',
                                                                hintStyle:
                                                                    const TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .description,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                                labelText:
                                                                    'Note',
                                                                labelStyle:
                                                                    const TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                ),
                                                                // focusColor: kOrange,
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.red,
                                                  backgroundColor: Colors.red,
                                                ),
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.red,
                                                  backgroundColor: Colors.red,
                                                ),
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('Rooms')
                                                      .doc(document.id)
                                                      .update({
                                                    'note': noteController.text,
                                                  }).then((value) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            'Successfully Saved'),
                                                      ),
                                                    );
                                                    Navigator.pop(context);
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
                                                  1.6,
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
                                                      'Note : ${data['note']}',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
