import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class DisplayEvents extends StatefulWidget {
  const DisplayEvents({Key? key}) : super(key: key);

  @override
  _DisplayEventsState createState() => _DisplayEventsState();
}

class _DisplayEventsState extends State<DisplayEvents> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Events')
  .snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Card(
                  child:Column(
                    children: [
                      Stack(
                        children: [
                          Ink.image(image: NetworkImage(
                              data["Image"]),
                            height: 240,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                      SizedBox(height:8),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Name : ${data["Name"]}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent
                        ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Time : ${data["Hours"]} hrs",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange
                        ),
                        ),
                      )

                    ],
                  )


                );
              }).toList(),
            );
          },
        ),
      ),
    );

    }
}
