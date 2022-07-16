import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignManager extends StatefulWidget {
  final String uId;
  const AssignManager({Key? key, required this.uId}) : super(key: key);

  @override
  _AssignManagerState createState() => _AssignManagerState();
}

class _AssignManagerState extends State<AssignManager> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('User')
      .where('Role', isNotEqualTo: 'GM')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assigned Manager'),
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

                  return data['Role'] == 'Admin'
                      ? Container()
                      : SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // var a=FirebaseAuth.instance.currentUser!.uid;
                                        // FirebaseFirestore.instance.collection('User')
                                        //     .doc(a)
                                        //     .update({
                                        //   "Status":"assigned",
                                        // }).then((value) => );
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) {
                                        //       return ChatScreen();
                                        //     }));
                                      },
                                      child: Card(
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
                                                      'Dept: ${data['Dept']}',
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
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
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
                                                              4.22,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'LongTermRequest')
                                                                .doc(widget.uId)
                                                                .update({
                                                              'manag_Name':
                                                                  '${data['Username']}',
                                                              'manager_uid':
                                                                  '${document.id}',
                                                              'Dept':
                                                                  '${data['Dept']}'
                                                            }).then((value) {
                                                              print(
                                                                  'Succesfully Value Updated');
                                                              Navigator.pop(
                                                                  context);
                                                            });
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
                                                                          color:
                                                                              Colors.white))))),
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
      //bottomNavigationBar: BottomNavBarHKM(),
    );
  }
}
