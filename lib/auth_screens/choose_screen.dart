import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/gm_home_page.dart';
import 'package:hotel_hub/GeneralManager/gm_profile.dart';
import 'package:hotel_hub/User/user_home_page.dart';
import 'package:hotel_hub/admin/admin_categories.dart';
import 'package:hotel_hub/admin/categories.dart';
import 'package:hotel_hub/assitant_general_manager/agm_home_page.dart';
import 'package:hotel_hub/assitant_general_manager/agm_profile.dart';
import 'package:hotel_hub/engineering_manager/em_home_page.dart';
import 'package:hotel_hub/engineering_manager/em_profile.dart';
import 'package:hotel_hub/food_and_beverage_manager/fbm_home_page.dart';
import 'package:hotel_hub/food_and_beverage_manager/fbm_profile.dart';
import 'package:hotel_hub/house_keeping_manager/hkm_home_page.dart';
import 'package:hotel_hub/sales_manager/sm_home_page.dart';

class ChooseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.data!['Role'] == 'Admin') {
                print(snapshot.data!['Role']);
                return AdminCategories();
              } else if (snapshot.data!['Role'] == 'GM') {
                return GMHomePage();
              } else if (snapshot.data!['Role'] == 'AGM') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GMHomePage()),
                // );
                return AGMHomePage();
              } else if (snapshot.data!['Role'] == 'EM') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GMHomePage()),
                // );
                return EMHomePage();
              } else if (snapshot.data!['Role'] == 'HKM') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GMHomePage()),
                // );
                return HKMHomePage();
              } else if (snapshot.data!['Role'] == 'FBM') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GMHomePage()),
                // );
                return FBMHomePage();
              } else if (snapshot.data!['Role'] == 'SM') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GMHomePage()),
                // );
                return SMHomePage();
              } else if (snapshot.data!['Role'] == 'User') {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => GMHomePage()),
                // );
                return UserHomePage();
              }
              return Center(child: Text("Wrong Credentials"));
          }
        },
      ),
    );
  }
}
