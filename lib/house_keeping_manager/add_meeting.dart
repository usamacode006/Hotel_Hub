import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_hub/GeneralManager/custom_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class AddMeeting extends StatefulWidget {
  const AddMeeting({Key? key}) : super(key: key);

  @override
  _AddMeetingState createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController meetingDescription = TextEditingController();
  final TextEditingController price1 = TextEditingController();
  UploadTask? task;
  Timer? _timer;
  String CreaterName = '';
  File? image;

  @override
  void initState() {
    // TODO: implement initState
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('Use in initState');
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

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (Image == null) {
        return "select Image";
      }
      final imageTemprory = File(image!.path);
      setState(() {
        this.image = imageTemprory;
      });
    } on Exception catch (e) {
      print("failed to pickImage");
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252E4E),
      appBar: AppBar(
        backgroundColor: Color(0xFF252E4E),
        title: Text(
          "Add Meeting",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 22,
                          width: 22,
                          child: Icon(
                            Icons.emoji_events,
                            color: Color(0xFF252E4E),
                            size: 20,
                          ),
                        ),
                      ],
                    )),
                Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: TextField(
                      controller: meetingName,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Meeting Name',
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Stack(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 22,
                          width: 22,
                          child: Icon(
                            Icons.coffee,
                            color: Color(0xFF252E4E),
                            size: 20,
                          ),
                        ),
                      ],
                    )),
                Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: TextField(
                      controller: meetingDescription,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Description',
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  getImage();
                },
                child: ClipOval(
                    child: image != null
                        ? Image.file(
                            image!,
                            height: 160,
                            width: 160,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.camera_alt))),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  pickDate(context);
                },
                child: Text(
                  getText(),
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  pickTime(context);
                },
                child: Text(
                  getTimeText(),
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 230,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  if (image == null ||
                      meetingName.text.trim().isEmpty ||
                      meetingDescription.text.trim().isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Please enter all fields"),
                          actions: [
                            TextButton(
                              child: const Text('Continue'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    EasyLoading.show(status: "Uploading Now");
                    uploadToFirebase(meetingName.text.trim(),
                        meetingDescription.text.trim(), image, date, time);
                  }
                },
                child: Text(
                  'Upload',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future uploadToFirebase(
      String name, String des, File? img, DateTime date, TimeOfDay time) async {
    if (img == null) {
      return;
    }
    final fileName = File(image!.path);
    final destination = 'files/$fileName';
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      task = ref.putFile(image!);
      final snapShot = await task!.whenComplete(() {});
      final urlDownload = await snapShot.ref.getDownloadURL();
      //print("donload link is $urlDownload");
      var db = FirebaseFirestore.instance.collection('Meeting');

      Map<String, dynamic> ourData = {
        "Name": name,
        "Description": des,
        "Image": urlDownload,
        "Date": DateFormat('MM/dd/yyyy').format(date),
        "Hours": time.hour.toString(),
        "Mins": time.minute.toString(),
        "Room": null,
        'CreatedBy': CreaterName,
        'Status': 'NotStarted',
      };

      db.doc(name).set(ourData).then((value) {
        EasyLoading.showSuccess("Uploaded");
        EasyLoading.dismiss();
      });
    } on FirebaseException catch (e) {
      return null;
    }
  }

  DateTime date = DateTime.now();

  String getText() {
    if (date == DateTime.now()) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(date);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }

  TimeOfDay time = TimeOfDay(hour: 9, minute: 0);
  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }

  String getTimeText() {
    if (time == TimeOfDay(hour: 9, minute: 0)) {
      return 'Select Time';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }
}
