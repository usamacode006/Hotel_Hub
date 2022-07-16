// if (data != null) {
//   return GridView.builder(
//       shrinkWrap: true,
//       padding: EdgeInsets.all(2),
//       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20),
//       itemCount: img.length,
//       itemBuilder: (BuildContext ctx, index) {
//         return InkWell(
//           onTap: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 Color activeColor = Colors.white;
//                 Color inactiveColor = Colors.white;
//
//                 return AlertDialog(
//                   content: StatefulBuilder(
//                     // You need this, notice the parameters below:
//                     builder: (BuildContext context,
//                         StateSetter setState) {
//                       return SizedBox(
//                         height: 400,
//                         width: 600,
//                         child: Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 // setState(() {
//                                 //   activeColor =
//                                 //       Colors.deepPurple;
//                                 //   inactiveColor =
//                                 //       Colors.white;
//                                 //   payment_Method =
//                                 //   "JazzCash";
//                                 // });
//                               },
//                               child: Container(
//                                 color: activeColor,
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       img[index],
//                                       height: 200,
//                                       width: 200,
//                                       fit: BoxFit.contain,
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         "Name : Towel",
//                                         style: TextStyle(
//                                             fontSize: 17,
//                                             fontWeight:
//                                                 FontWeight.bold,
//                                             wordSpacing: 10),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         "Count in Storage : 32",
//                                         style: TextStyle(
//                                             fontSize: 17,
//                                             fontWeight:
//                                                 FontWeight.bold,
//                                             wordSpacing: 2),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         "Assigned : 32",
//                                         style: TextStyle(
//                                             fontSize: 17,
//                                             fontWeight:
//                                                 FontWeight.bold,
//                                             wordSpacing: 12),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             // InkWell(
//                             //   onTap: () {
//                             //     setState(() {
//                             //       inactiveColor =
//                             //           Colors.deepPurple;
//                             //       activeColor =
//                             //           Colors.white;
//                             //       payment_Method = "Cash";
//                             //     });
//                             //   },
//                             //   child: Card(
//                             //     child: Container(
//                             //       height: 100,
//                             //       width: 300,
//                             //       color: inactiveColor,
//                             //       child: Row(
//                             //         children: [
//                             //           Image.asset(
//                             //             'images/cash.jpg',
//                             //             height: 100,
//                             //             width: 80,
//                             //             fit: BoxFit
//                             //                 .contain,
//                             //           ),
//                             //           SizedBox(
//                             //             width: 4,
//                             //           ),
//                             //           Text(
//                             //             "On Arrival Payment",
//                             //             style: TextStyle(
//                             //                 fontSize: 14,
//                             //                 fontWeight:
//                             //                 FontWeight
//                             //                     .bold),
//                             //           )
//                             //         ],
//                             //       ),
//                             //     ),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                   actions: [
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         primary: Colors.red,
//                         backgroundColor: Colors.red,
//                       ),
//                       child: Text(
//                         "Assign",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                         showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 content: StatefulBuilder(
//                                   // You need this, notice the parameters below:
//                                   builder: (BuildContext context,
//                                       StateSetter setState) {
//                                     return Container(
//                                       height: 250,
//                                       width: 500,
//                                       child: Column(
//                                         children: [
//                                           InkWell(
//                                             onTap: () {
//                                               setState(() {
//                                                 activeColor = Colors
//                                                     .deepPurple;
//                                                 inactiveColor =
//                                                     Colors.white;
//                                                 choose = "room";
//                                               });
//                                             },
//                                             child: Card(
//                                               child: Container(
//                                                 color: activeColor,
//                                                 child: Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/rooms.jpg',
//                                                       height: 100,
//                                                       width: 80,
//                                                       fit: BoxFit
//                                                           .contain,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 7,
//                                                     ),
//                                                     Text(
//                                                       "Assign Room",
//                                                       style: TextStyle(
//                                                           fontSize:
//                                                               14,
//                                                           fontWeight:
//                                                               FontWeight
//                                                                   .bold),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                           InkWell(
//                                             onTap: () {
//                                               setState(() {
//                                                 inactiveColor =
//                                                     Colors
//                                                         .deepPurple;
//                                                 activeColor =
//                                                     Colors.white;
//                                                 choose = "employ";
//                                               });
//                                             },
//                                             child: Card(
//                                               child: Container(
//                                                 color:
//                                                     inactiveColor,
//                                                 child: Row(
//                                                   children: [
//                                                     Image.asset(
//                                                       'images/sec.png',
//                                                       height: 100,
//                                                       width: 80,
//                                                       fit: BoxFit
//                                                           .contain,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 4,
//                                                     ),
//                                                     Text(
//                                                       "Assign Employee",
//                                                       style: TextStyle(
//                                                           fontSize:
//                                                               14,
//                                                           fontWeight:
//                                                               FontWeight
//                                                                   .bold),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     style: TextButton.styleFrom(
//                                       primary: Colors.red,
//                                       backgroundColor: Colors.red,
//                                     ),
//                                     child: Text(
//                                       "Proceed",
//                                       style: TextStyle(
//                                           color: Colors.white),
//                                     ),
//                                     onPressed: () {
//                                       if (choose == "employ") {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 Employees(
//                                               department:
//                                                   'Housekeeping',
//                                               requestUid:
//                                                   title[index],
//                                               manager_uid:
//                                                   AssignBy_uid,
//                                               manager_name:
//                                                   AssignBy_name,
//                                             ),
//                                           ),
//                                         );
//                                       } else if (choose == "room") {
//                                         // Navigator.push(
//                                         //   context,
//                                         //   MaterialPageRoute(
//                                         //       builder: (context) =>
//                                         //           PaymentUI()),
//                                         // );
//                                       } else {
//                                         // EasyLoading.show(
//                                         //     status:
//                                         //         "Creating request");
//                                         // await updateValue();
//                                       }
//
//                                       //print("$a"); //causing the issue neeed to solve
//                                     },
//                                   ),
//                                 ],
//                               );
//                             });
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//           child: GridTile(
//             child: Image.asset(
//               img[index],
//               fit: BoxFit.cover,
//             ),
//             footer: GridTileBar(
//               backgroundColor: Colors.black54,
//               title: Text(
//                 title[index],
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         );
//       });
// }

// itemCount: img.length,
// itemBuilder: (BuildContext ctx, index) {
//   return InkWell(
//     onTap: () {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           Color activeColor = Colors.white;
//           Color inactiveColor = Colors.white;
//
//           return AlertDialog(
//             content: StatefulBuilder(
//               // You need this, notice the parameters below:
//               builder:
//                   (BuildContext context, StateSetter setState) {
//                 return SizedBox(
//                   height: 400,
//                   width: 600,
//                   child: Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           // setState(() {
//                           //   activeColor =
//                           //       Colors.deepPurple;
//                           //   inactiveColor =
//                           //       Colors.white;
//                           //   payment_Method =
//                           //   "JazzCash";
//                           // });
//                         },
//                         child: Container(
//                           color: activeColor,
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 img[index],
//                                 height: 200,
//                                 width: 200,
//                                 fit: BoxFit.contain,
//                               ),
//                               SizedBox(
//                                 height: 7,
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Name : Towel",
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight:
//                                           FontWeight.bold,
//                                       wordSpacing: 10),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 7,
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Count in Storage : 32",
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight:
//                                           FontWeight.bold,
//                                       wordSpacing: 2),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 7,
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Assigned : 32",
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight:
//                                           FontWeight.bold,
//                                       wordSpacing: 12),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       // InkWell(
//                       //   onTap: () {
//                       //     setState(() {
//                       //       inactiveColor =
//                       //           Colors.deepPurple;
//                       //       activeColor =
//                       //           Colors.white;
//                       //       payment_Method = "Cash";
//                       //     });
//                       //   },
//                       //   child: Card(
//                       //     child: Container(
//                       //       height: 100,
//                       //       width: 300,
//                       //       color: inactiveColor,
//                       //       child: Row(
//                       //         children: [
//                       //           Image.asset(
//                       //             'images/cash.jpg',
//                       //             height: 100,
//                       //             width: 80,
//                       //             fit: BoxFit
//                       //                 .contain,
//                       //           ),
//                       //           SizedBox(
//                       //             width: 4,
//                       //           ),
//                       //           Text(
//                       //             "On Arrival Payment",
//                       //             style: TextStyle(
//                       //                 fontSize: 14,
//                       //                 fontWeight:
//                       //                 FontWeight
//                       //                     .bold),
//                       //           )
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             actions: [
//               TextButton(
//                 style: TextButton.styleFrom(
//                   primary: Colors.red,
//                   backgroundColor: Colors.red,
//                 ),
//                 child: Text(
//                   "Assign",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           content: StatefulBuilder(
//                             // You need this, notice the parameters below:
//                             builder: (BuildContext context,
//                                 StateSetter setState) {
//                               return Container(
//                                 height: 250,
//                                 width: 500,
//                                 child: Column(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           activeColor =
//                                               Colors.deepPurple;
//                                           inactiveColor =
//                                               Colors.white;
//                                           choose = "room";
//                                         });
//                                       },
//                                       child: Card(
//                                         child: Container(
//                                           color: activeColor,
//                                           child: Row(
//                                             children: [
//                                               Image.asset(
//                                                 'images/rooms.jpg',
//                                                 height: 100,
//                                                 width: 80,
//                                                 fit: BoxFit
//                                                     .contain,
//                                               ),
//                                               SizedBox(
//                                                 width: 7,
//                                               ),
//                                               Text(
//                                                 "Assign Room",
//                                                 style: TextStyle(
//                                                     fontSize:
//                                                         14,
//                                                     fontWeight:
//                                                         FontWeight
//                                                             .bold),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           inactiveColor =
//                                               Colors.deepPurple;
//                                           activeColor =
//                                               Colors.white;
//                                           choose = "employ";
//                                         });
//                                       },
//                                       child: Card(
//                                         child: Container(
//                                           color: inactiveColor,
//                                           child: Row(
//                                             children: [
//                                               Image.asset(
//                                                 'images/sec.png',
//                                                 height: 100,
//                                                 width: 80,
//                                                 fit: BoxFit
//                                                     .contain,
//                                               ),
//                                               SizedBox(
//                                                 width: 4,
//                                               ),
//                                               Text(
//                                                 "Assign Employee",
//                                                 style: TextStyle(
//                                                     fontSize:
//                                                         14,
//                                                     fontWeight:
//                                                         FontWeight
//                                                             .bold),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                           actions: [
//                             TextButton(
//                               style: TextButton.styleFrom(
//                                 primary: Colors.red,
//                                 backgroundColor: Colors.red,
//                               ),
//                               child: Text(
//                                 "Proceed",
//                                 style: TextStyle(
//                                     color: Colors.white),
//                               ),
//                               onPressed: () {
//                                 if (choose == "employ") {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           Employees(
//                                         department:
//                                             'Housekeeping',
//                                         requestUid:
//                                             title[index],
//                                         manager_uid:
//                                             AssignBy_uid,
//                                         manager_name:
//                                             AssignBy_name,
//                                       ),
//                                     ),
//                                   );
//                                 } else if (choose == "room") {
//                                   // Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //       builder: (context) =>
//                                   //           PaymentUI()),
//                                   // );
//                                 } else {
//                                   // EasyLoading.show(
//                                   //     status:
//                                   //         "Creating request");
//                                   // await updateValue();
//                                 }
//
//                                 //print("$a"); //causing the issue neeed to solve
//                               },
//                             ),
//                           ],
//                         );
//                       });
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     },
//     child: GridTile(
//       child: Image.asset(
//         img[index],
//         fit: BoxFit.cover,
//       ),
//       footer: GridTileBar(
//         backgroundColor: Colors.black54,
//         title: Text(
//           title[index],
//           textAlign: TextAlign.center,
//         ),
//       ),
//     ),
//   );
// }

// InkWell(
//   onTap: () {
//     setState(() {
//       inactiveColor =
//           Colors.deepPurple;
//       activeColor =
//           Colors.white;
//       payment_Method = "Cash";
//     });
//   },
//   child: Card(
//     child: Container(
//       height: 100,
//       width: 300,
//       color: inactiveColor,
//       child: Row(
//         children: [
//           Image.asset(
//             'images/cash.jpg',
//             height: 100,
//             width: 80,
//             fit: BoxFit
//                 .contain,
//           ),
//           SizedBox(
//             width: 4,
//           ),
//           Text(
//             "On Arrival Payment",
//             style: TextStyle(
//                 fontSize: 14,
//                 fontWeight:
//                 FontWeight
//                     .bold),
//           )
//         ],
//       ),
//     ),
//   ),
// ),
