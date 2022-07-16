import 'dart:convert';

import 'package:flutter/material.dart';

import '../main.dart';
import '../palette.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';



class SendNotifications extends StatefulWidget {
  const SendNotifications({Key? key}) : super(key: key);

  @override
  _SendNotificationsState createState() => _SendNotificationsState();
}

class _SendNotificationsState extends State<SendNotifications> {
  final TextEditingController passwordController = TextEditingController();
  String dropdownvalue = 'GM';

  // List of items in our dropdown menu
  var items = [
    'GM',
    'AGM',
    'Managers',
    'Employees',
    'FrontDesk',
  ];
  List<String> li=[
    "0383e7a0-82fd-11ec-a15f-228fd8ddbe63",
  ];
  Future<Response> sendNotification(List<String> tokenIdList, String contents, String heading) async{

    return await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>
      {
        "app_id": kAppId,//kAppId is the App Id that one get from the OneSignal When the application is registered.

        "include_player_ids": tokenIdList,//tokenIdList Is the List of All the Token Id to to Whom notification must be sent.

        // android_accent_color reprsent the color of the heading text in the notifiction
        "android_accent_color":"FF9976D2",

        "small_icon":"ic_stat_onesignal_default",

        "large_icon":"https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",

        "headings": {"en": heading},

        "contents": {"en": contents},


      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geeksforgeeks"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(

                keyboardType: TextInputType.text,
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.list,
                    color: Palette.iconColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Palette.textColor1),
                    borderRadius:
                    BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Palette.textColor1),
                    borderRadius:
                    BorderRadius.all(Radius.circular(35.0)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Message",
                  hintStyle: TextStyle(
                      fontSize: 14, color: Palette.textColor1),
                ),
              ),
            ),

            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                child: Text("press"),
                onPressed: () async{
                  await sendNotification(li,passwordController.text.trim(),"Managers");

                },
              ),
            )
          ],
        ),

      ),
    );
  }
}
