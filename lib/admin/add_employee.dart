import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_hub/GeneralManager/gm_home_page.dart';
import 'package:hotel_hub/admin/admin_categories.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  @override
  final TextEditingController eventName = TextEditingController();
  final TextEditingController eventDescription = TextEditingController();
  final TextEditingController price1 = TextEditingController();
  UploadTask? task;
  Timer? _timer;

  File? image;
  String dropdownvalue = 'Housekeeping';

  // List of items in our dropdown menu
  var items = [
    'Housekeeping',
    'Engineering',
    'Food',
    'Sales',
    'Front Desk',
    'Security',
    'other'
  ];

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
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252E4E),
      appBar: AppBar(
        backgroundColor: Color(0xFF252E4E),
        title: Text("Add Event",
          style: TextStyle(
              color: Colors.white
          ),
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
                            Icons.person,
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
                      controller: eventName,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'First Name',
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.black
                          )
                      ),
                      style: TextStyle(fontSize: 16,
                          color: Colors.black),
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
                      controller: eventDescription,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Last Name',
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.black
                          )
                      ),
                      style: TextStyle(fontSize: 16,
                          color: Colors.black),
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(onTap: () {
              getImage();
            }, child: ClipOval(child: image != null ? Image.file(image!,
              height: 160,
              width: 160,
              fit: BoxFit.cover,

            ) : Icon(Icons.camera_alt))),
            SizedBox(
              height: 30,
            ),

            SizedBox(
              height: 30,
            ),

            SizedBox(
              height: 40,
              width: 230,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(
                      Colors.white),

                ),
                onPressed: () {



                  if (image == null || eventName.text.trim().isEmpty || eventDescription.text
                      .trim()
                      .isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return  AlertDialog(
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
                  }
                  else {
                    EasyLoading.show(status: "Uploading Now");
                    uploadToFirebase(
                        eventName.text.trim(), eventDescription.text.trim(),image,dropdownvalue);
                  }
                },

                child: Text('Upload',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  Future uploadToFirebase( String name, String des,File? img,String dept) async {
    if (img == null) {
      return;
    }
    final fileName = File(image!.path);
    final destination = 'files/$fileName';
    try {
      final ref = FirebaseStorage.instance.ref(destination);


      task = ref.putFile(image!);
      final snapShot = await task!.whenComplete(() {

      });
      final urlDownload = await snapShot.ref.getDownloadURL();
      print("donload link is $urlDownload");
      var db = FirebaseFirestore.instance.collection('Employee');



      Map<String, dynamic> ourData = {
        "Name": name,
        "Description": des,
        "Image": urlDownload,
        "Dept":dept


      };

      db.add(ourData).then((value) {
        EasyLoading.showSuccess("Uploaded");
        EasyLoading.dismiss();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AdminCategories()));
      });
    }

    on FirebaseException catch (e) {
      return null;
    }
  }
}
