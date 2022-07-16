import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_hub/auth_screens/choose_screen.dart';
import 'package:hotel_hub/auth_screens/login.dart';
import 'package:provider/src/provider.dart';

class AuthenticationWrapper extends StatelessWidget with ChangeNotifier{
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    notifyListeners();

    if (firebaseUser != null) {
      notifyListeners();
      return ChooseScreen();

    }
    notifyListeners();
    return Login();

  }
}

