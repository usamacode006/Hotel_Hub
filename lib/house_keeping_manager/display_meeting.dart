import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DisplayMeeting extends StatefulWidget {
  const DisplayMeeting({Key? key}) : super(key: key);

  @override
  _DisplayMeetingState createState() => _DisplayMeetingState();
}

class _DisplayMeetingState extends State<DisplayMeeting> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Meeting').snapshots();
  // String CreaterName = '';
  String CreaterName = '';

  @override
  void initState() {
    // TODO: implement initState
    // FirebaseFirestore.instance
    //     .collection('User')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .snapshots()
    //     .map((DocumentSnapshot snapshot) {
    //   CreaterName = snapshot.get('Username');
    //   print(snapshot.get('Username'));
    // });
    final a = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('User').doc(a).get().then((value) {
      setState(() {
        print(value.get("Username"));
        CreaterName = value.get("Username");
        print(CreaterName);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meetings"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                    child: Column(
                  children: [
                    Stack(
                      children: [
                        Ink.image(
                          image: NetworkImage(data["Image"]),
                          height: 240,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Name : ${data["Name"]}",
                        style:
                            TextStyle(fontSize: 18, color: Colors.blueAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Time : ${data["Hours"]} hrs",
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Created By : ${data["CreatedBy"]}",
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                      ),
                    ),
                  ],
                ));
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
