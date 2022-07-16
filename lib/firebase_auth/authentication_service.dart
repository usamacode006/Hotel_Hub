import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/gm_profile.dart';
import 'package:hotel_hub/admin/admin_categories.dart';
import 'package:hotel_hub/assitant_general_manager/agm_profile.dart';
import 'package:hotel_hub/auth_screens/choose_screen.dart';
import 'package:hotel_hub/auth_screens/login.dart';
import 'package:hotel_hub/auth_screens/register.dart';
import 'package:hotel_hub/engineering_manager/em_profile.dart';
import 'package:hotel_hub/food_and_beverage_manager/fbm_profile.dart';
import 'package:hotel_hub/house_keeping_manager/hkm_profile.dart';
import 'package:hotel_hub/sales_manager/sm_profile.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;


  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();


  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
  Future<String?> signUp({
    required userName,
    required String email,
    required String password,
    required String role,
    required String phone,
    required String dept,
    required BuildContext context,
  }) async {
    try {
      var status = await OneSignal.shared.getDeviceState();
      String? tokenId = status!.userId;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => FirebaseFirestore.instance
          .collection('User')
          .doc(value.user!.uid)
          .set({
        'Username': userName,
        'Email': email,
        'Role': role,
        'Image': "default",
        'Dept': "unassigned",
        "tokenId": tokenId,
        "Status":"unassigned",
        "phone": phone,
        "Uid": value.user!.uid,
      }).then((value) {
        print('then//////////////////');
        if (role == 'Admin') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminCategories()),
          );
        } else if (role == 'GM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GmProfile()),
          );
        } else if (role == 'AGM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AGMProfile()),
          );
        } else if (role == 'EM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EMProfile()),
          );
        } else if (role == 'FBM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FBMProfile()),
          );
        } else if (role == 'HKM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HKMProfile()),
          );
        } else if (role == 'SM') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SMProfile()),
          );
        }
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => GmProfile()),
        // );
      }));

      return "Signed up";
    } on FirebaseAuthException catch (e) {
      print('eroor.///////////////////////////////');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Register('', role)),
      );

      return e.message;
    }
  }
  Future<String?> signIn({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        var status = await OneSignal.shared.getDeviceState();
        String? tokenId = status!.userId;
        FirebaseFirestore.instance.collection("User").doc(FirebaseAuth.instance.currentUser!.uid).update({"tokenId":tokenId});

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChooseScreen()),
        );
      });

      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );

      return e.message;
    }
  }

}
