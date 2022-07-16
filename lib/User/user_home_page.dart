import 'package:flutter/material.dart';
import 'package:hotel_hub/admin/send_notifications.dart';
import 'package:hotel_hub/auth_screens/login.dart';
import 'package:hotel_hub/firebase_auth/authentication_service.dart';
import 'package:hotel_hub/request/create_request.dart';
import 'package:hotel_hub/request/request.dart';
import 'package:provider/src/provider.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                child: Text('Request'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateRequest()),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text("FrontDesk Agent home Page"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Signout'),
                onPressed: (){
                  context.read<AuthenticationService>().signOut(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}