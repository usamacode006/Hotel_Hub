import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}

//
//
//
// showDialog(
// context: context,
// builder: (context) {
// return AlertDialog(
// content: StatefulBuilder(
// // You need this, notice the parameters below:
// builder: (BuildContext context,
// StateSetter setState) {
// return Container(
// height: 150,
// width: 500,
// child: Column(
// children: [
// Padding(
// padding:
// const EdgeInsets.only(
// bottom: 8.0),
// child: TextField(
// keyboardType:
// TextInputType.number,
// controller: roomController,
// decoration: InputDecoration(
// enabledBorder:
// OutlineInputBorder(
// borderSide: BorderSide(
// color: Palette
//     .textColor1),
// borderRadius:
// BorderRadius.all(
// Radius.circular(
// 35.0)),
// ),
// focusedBorder:
// OutlineInputBorder(
// borderSide: BorderSide(
// color: Palette
//     .textColor1),
// borderRadius:
// BorderRadius.all(
// Radius.circular(
// 35.0)),
// ),
// contentPadding:
// EdgeInsets.all(10),
// hintText: "Enter Rooms",
// hintStyle: TextStyle(
// fontSize: 14,
// color: Palette
//     .textColor1),
// prefixText: '   ',
// ),
// ),
// ),
// SizedBox(
// height: 15,
// ),
// Padding(
// padding:
// const EdgeInsets.only(
// bottom: 8.0),
// child: TextField(
// //obscureText: true,
// keyboardType:
// TextInputType.number,
// controller: perController,
// decoration: InputDecoration(
// enabledBorder:
// OutlineInputBorder(
// borderSide: BorderSide(
// color: Palette
//     .textColor1),
// borderRadius:
// BorderRadius.all(
// Radius
//     .circular(
// 35.0)),
// ),
// focusedBorder:
// OutlineInputBorder(
// borderSide: BorderSide(
// color: Palette
//     .textColor1),
// borderRadius:
// BorderRadius.all(
// Radius
//     .circular(
// 35.0)),
// ),
// contentPadding:
// EdgeInsets.all(10),
// hintText: "Enter Per",
// hintStyle: TextStyle(
// fontSize: 14,
// color: Palette
//     .textColor1),
// prefixText: '   '),
// ),
// ),
// ],
// ),
// );
// },
// ),
// actions: [
// TextButton(
// style: TextButton.styleFrom(
// primary: Colors.red,
// backgroundColor: Colors.red,
// ),
// child: Text(
// "Proceed",
// style:
// TextStyle(color: Colors.white),
// ),
// onPressed: () {},
// ),
// ],
// );
// });
