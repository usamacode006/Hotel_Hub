import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_hub/GeneralManager/custom_animations.dart';
import 'package:hotel_hub/GeneralManager/gm_home_page.dart';
import 'package:hotel_hub/engineering_manager/em_home_page.dart';
import 'package:image_picker/image_picker.dart';

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

double hei = 0;
double wid = 0;

class EMProfile extends StatefulWidget {
  const EMProfile({Key? key}) : super(key: key);

  @override
  _EMProfileState createState() => _EMProfileState();
}

class _EMProfileState extends State<EMProfile> {
  UploadTask? task;
  File? image;
  Timer? _timer;
  int i = 0;
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

  void initstate() {
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('Use in initState');
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    hei = MediaQuery.of(context).size.height;
    wid = MediaQuery.of(context).size.width;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return Scaffold(
              key: _scaffoldKey,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.lightGreen,
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (image != null && snapshot.data!['Image'] == "default") {
                    EasyLoading.show(status: "Uploading Now");
                    uploadToFirebase(image);
                  } else if (image != null &&
                      snapshot.data!['Image'] != "default") {
                    EasyLoading.show(status: "Uploading Now");
                    uploadToFirebase(image);
                  } else if (image == null &&
                      snapshot.data!['Image'] == "default") {
                    _scaffoldKey.currentState!.showSnackBar(
                        SnackBar(content: Text("Please Select Image")));
                  } else if (image == null &&
                      snapshot.data!['Image'] != "default") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GMHomePage()),
                    );
                  }
                },
              ),
              body: Column(children: [
                Container(
                  height: hei / 5.25,
                  width: wid,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0)),
                      gradient: LinearGradient(
                          colors: const [Colors.lightGreen, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: hei / 37.421,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(children: <Widget>[
                    Container(
                      height: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 30.0),
                      child: Text(
                        snapshot.data!['Username'],
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 80.0),
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Center(
                      child: InkWell(
                          onTap: () async {
                            await getImage();
                          },
                          child: snapshot.data!['Image'] == "default"
                              ? ClipOval(
                                  child: image != null
                                      ? Image.file(
                                          image!,
                                          height: 160,
                                          width: 160,
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(
                                          Icons.camera_alt,
                                        ),
                                )
                              : ClipOval(
                                  child: Image.network(
                                    snapshot.data!['Image'],
                                    height: 160,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                    ),
                    // InkWell(
                    //   onTap: () async{
                    //     await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).delete();
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => Login()),
                    //     );
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.bottomCenter,
                    //     margin: EdgeInsets.only(bottom: 40),
                    //     child: Text('Delete profile',
                    //       style: TextStyle(
                    //           color: Colors.redAccent,
                    //           fontSize: hei / 47.4
                    //       ),),
                    //   ),
                    // ),
                  ]),
                )
              ]));
        });
  }

  Future uploadToFirebase(File? img) async {
    final fileName = File(image!.path);
    final destination = 'files/$fileName';
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      task = ref.putFile(image!);
      final snapShot = await task!.whenComplete(() {});
      final urlDownload = await snapShot.ref.getDownloadURL();
      print("donload link is $urlDownload");
      var db = FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      Map<String, dynamic> ourData = {'Image': urlDownload};

      db.update(ourData).then((value) {
        EasyLoading.showSuccess("Uploaded");
        EasyLoading.dismiss();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EMHomePage()),
        );
      });
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
