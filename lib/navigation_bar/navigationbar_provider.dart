import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/GeneralManager/assigned_general_manager.dart';
import 'package:hotel_hub/GeneralManager/delete_gm.dart';
import 'package:hotel_hub/GeneralManager/gm_home_page.dart';
import 'package:hotel_hub/GeneralManager/unassigned_gm.dart';
import 'package:hotel_hub/admin/admin_categories.dart';
import 'package:hotel_hub/admin/categories.dart';
import 'package:hotel_hub/assitant_general_manager/agm_home_page.dart';
import 'package:hotel_hub/assitant_general_manager/assigned_agm.dart';
import 'package:hotel_hub/assitant_general_manager/delete_agm.dart';
import 'package:hotel_hub/assitant_general_manager/unassigned_agm.dart';
import 'package:hotel_hub/engineering_manager/assigned_em.dart';
import 'package:hotel_hub/engineering_manager/delete_em.dart';
import 'package:hotel_hub/engineering_manager/em_home_page.dart';
import 'package:hotel_hub/engineering_manager/unassigned_em.dart';
import 'package:hotel_hub/firebase_auth/authentication_wrapper.dart';
import 'package:hotel_hub/food_and_beverage_manager/assigned_fbm.dart';
import 'package:hotel_hub/food_and_beverage_manager/delete_fbm.dart';
import 'package:hotel_hub/food_and_beverage_manager/fbm_home_page.dart';
import 'package:hotel_hub/food_and_beverage_manager/unassigned_fbm.dart';
import 'package:hotel_hub/house_keeping_manager/assigned_hkm.dart';
import 'package:hotel_hub/house_keeping_manager/delete_hkm.dart';
import 'package:hotel_hub/house_keeping_manager/hkm_home_page.dart';
import 'package:hotel_hub/house_keeping_manager/unassigned_hkm.dart';
import 'package:hotel_hub/request/assigned_request.dart';
import 'package:hotel_hub/request/create_long_term.dart';
import 'package:hotel_hub/request/create_request.dart';
import 'package:hotel_hub/request/request.dart';
import 'package:hotel_hub/sales_manager/assigned_sm.dart';
import 'package:hotel_hub/sales_manager/delete_sm.dart';
import 'package:hotel_hub/sales_manager/sm_home_page.dart';
import 'package:hotel_hub/sales_manager/unassigned_sm.dart';

class NavProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  final int _previousindex = 0;

  var _color = Colors.grey;

  int get selectedIndex => _selectedIndex;

  int get previousIndex => _previousindex;

  String manager_Name = '';

  Color get colorss => _color;

  var a = FirebaseAuth.instance.currentUser!.uid;
  var collection = FirebaseFirestore.instance.collection('User');

  onItemTapped(int index) {
    //_previousindex=_selectedIndex;

    _selectedIndex = index;
    _color = Colors.lightGreen;
    notifyListeners();
  }

  navToGM(BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminCategories()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UnassignedGeneralManager()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AssignedGM()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeleteGM()),
      );
    }
  }

  navToAGM(BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminCategories()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UnassignedAGM()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AssignedAGM()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeleteAGM()),
      );
    }
  }

  navToEM(BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminCategories()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UnassignedEM()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AssignedEM()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeleteEM()),
      );
    }
  }

  navToFBM(BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminCategories()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UnassignedFBM()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AssignedFBM()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeleteFBM()),
      );
    }
  }

  navToHKM(BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminCategories()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UnassignedHKM()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AssignedHKM()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeleteHKM()),
      );
    }
  }

  navToSM(BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminCategories()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UnassignedSM()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AssignedSM()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeleteSM()),
      );
    }
  }

  navBack(BuildContext context) {
    _selectedIndex = 0;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminCategories()),
    );

    notifyListeners();
  }

  GMHomePageNavBar(BuildContext context) async {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GMHomePage()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayShortList()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayShortList()),
      );
    }
    if (_selectedIndex == 3) {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AuthenticationWrapper()),
      );
    }
  }

  HKMHomePageNavBar(BuildContext context) async {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HKMHomePage()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayShortList()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateRequest()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Request()),
      );
    }
  }

  AGMHomePageNavBar(BuildContext context) async {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AGMHomePage()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayShortList()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateRequest()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Request()),
      );
    }
  }

  EMHomePageNavBar(BuildContext context) async {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EMHomePage()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayShortList()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateRequest()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Request()),
      );
    }
  }

  FBMHomePageNavBar(BuildContext context) async {
    var docSnapshot = await collection.doc(a).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();

      manager_Name = data?['Username'];
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FBMHomePage()),
        );
      }
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LongTermRequest(uid: a, managerName: manager_Name)),
        );
      }
      if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateRequest()),
        );
      }
      if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Request()),
        );
      }
    }
  }

  SMHomePageNavBar(BuildContext context) async {
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SMHomePage()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayShortList()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateRequest()),
      );
    }
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Request()),
      );
    }
  }
}
