import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/notes_page.dart';
import 'package:hotel_hub/Provider/notification_provider.dart';
import 'package:hotel_hub/admin/real_send_notifications.dart';
import 'package:hotel_hub/admin/send_notifications.dart';
import 'package:provider/src/provider.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../main.dart';
import '../palette.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({Key? key}) : super(key: key);

  @override
  _CreateRequestState createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  FocusNode textSecondFocusNode = FocusNode();
  int notesHeaderMaxLenth = 25;
  int notesDescriptionMaxLines = 10;
  int notesDescriptionMaxLenth = 150;
  String deletedNoteHeading = "";
  String deletedNoteDescription = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ShortdescriptionController = TextEditingController();
  List<String> li = [];
  Future<Response> sendNotification(
      List<String> tokenIdList, String contents, String heading) async {
    return await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "app_id":
            kAppId, //kAppId is the App Id that one get from the OneSignal When the application is registered.

        "include_player_ids":
            tokenIdList, //tokenIdList Is the List of All the Token Id to to Whom notification must be sent.

        // android_accent_color reprsent the color of the heading text in the notifiction
        "android_accent_color": "FF9976D2",

        "small_icon": "ic_stat_onesignal_default",

        "large_icon":
            "https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",

        "headings": {"en": heading},

        "contents": {"en": contents},
      }),
    );
  }

  Color color = Colors.pink[300]!;
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Requests'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 8),
              child: Container(
                child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'TITLE',
                      hintText: 'TITLE',
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 8),
              child: Container(
                child: TextField(
                    controller: ShortdescriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Short desc',
                      hintText: 'Short desc',
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                margin: EdgeInsets.all(1),
                height: 5 * 24.0,
                child: TextField(
                  controller: descriptionController,
                  focusNode: textSecondFocusNode,
                  maxLines: notesDescriptionMaxLines,
                  maxLength: notesDescriptionMaxLenth,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      fontSize: 15.00,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: 40,
                width: 230,
                child: ElevatedButton(
                  child: Text("Request"),
                  onPressed: () async {
                    FirebaseFirestore.instance.collection('Request').add({
                      'status': 'unassigned',
                      'employ': 'unassigned',
                      'title': titleController.text,
                      'description': descriptionController.text,
                      'long_desc': ShortdescriptionController.text.trim(),
                      'manager_uid': "",
                      "department": "",
                      "emp_uid": "",
                      "emp_Name": "",
                      "manag_Name": "",
                      "color": "$color"
                    }).then((value) => print('added request in firebase'));
                    await FirebaseFirestore.instance
                        .collection('User')
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      querySnapshot.docs.forEach((doc) {
                        if (doc["Role"] != "GM" &&
                            doc["Role"] != "Admin" &&
                            doc["Role"] != "User") {
                          print(doc["tokenId"]);
                          context
                              .read<NotificationProvider>()
                              .addManager("${doc["tokenId"]}");
                          //li.add("${doc["tokenId"]}");

                        }
                      });
                      sendNotification(
                          context.read<NotificationProvider>().ml,
                          descriptionController.text.trim(),
                          titleController.text.trim());
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Request Successfully Send.")));
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
