import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_hub/admin/admin_categories.dart';
import 'package:image_picker/image_picker.dart';

class UploadRoom extends StatefulWidget {
  const UploadRoom({Key? key}) : super(key: key);

  @override
  _UploadRoomState createState() => _UploadRoomState();
}

class _UploadRoomState extends State<UploadRoom> {
  TextEditingController roomNoController = TextEditingController();

  TextEditingController ShortdescriptionController = TextEditingController();
  UploadTask? task;
  Timer? _timer;

  File? image;

  void initstate() {
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('Use in initState');
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 8),
              child: TextField(
                  controller: roomNoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Room No',
                    hintText: 'Room No',
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
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
            SizedBox(
              height: 20,
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
              height: 40,
              width: 230,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orangeAccent),
                ),
                onPressed: () {
                  if (image == null ||
                      roomNoController.text.trim().isEmpty ||
                      ShortdescriptionController.text.trim().isEmpty) {
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
                    uploadToFirebase(roomNoController.text.trim(),
                        ShortdescriptionController.text.trim(), image);
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

  Future uploadToFirebase(String roomNo, String des, File? img) async {
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
      print("donload link is $urlDownload");
      var db = FirebaseFirestore.instance.collection('Rooms');

      Map<String, dynamic> ourData = {
        "RoomNo": roomNo,
        "Description": des,
        "Image": urlDownload,
        "status": "unassigned",
        "clean_status": "dirty",
        "dirty_type": "check out",
        "emp_uid": "",
        "emp_Name": "",
        "manag_Name": '',
        "manager_uid": "",
        'note': "",
      };
      db.add(ourData).then((value) {
        EasyLoading.showSuccess("Uploaded");
        EasyLoading.dismiss();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AdminCategories()));
      });
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
