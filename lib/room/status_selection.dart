import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hotel_hub/request/employ_list.dart';
import 'package:hotel_hub/room/assign_employ_to_room.dart';
import 'package:provider/provider.dart';

String department1 = "";
String request1 = "";
String manage = "";
String mang_name = "";

class StatusSelection extends StatefulWidget {
  final String department;
  final String requestUid;
  final String manager_uid;
  final String manager_name;

  StatusSelection(
      {required this.department,
      required this.requestUid,
      required this.manager_uid,
      required this.manager_name}) {
    department1 = department;
    request1 = requestUid;
    manage = manager_uid;
    mang_name = manager_name;
  }

  @override
  _StatusSelectionState createState() => _StatusSelectionState();
}

class _StatusSelectionState extends State<StatusSelection> {
  final cleaning_status = [
    "Dirty",
    "Clean",
  ];
  final dirty_type = [
    "Check Out",
    "Stay Over",
  ];
  var _currentSelectedValue;
  var _currentSelectedValue1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status Selection'),
        leading: Icon(
          Icons.arrow_back_ios_sharp,
        ),
      ),
      body: Column(
        children: [
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: InputDecorator(
                  decoration: InputDecoration(
                      fillColor: Color(0xff0f9df2).withOpacity(0.9),
                      //filled: true,
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      hintText: 'Select Cleaning Status',
                      //labelText: 'how are you',
                      hintStyle: const TextStyle(
                        color: Colors.black87,
                        backgroundColor: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7.0))),
                  isEmpty: _currentSelectedValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: _currentSelectedValue == null
                          ? const Text(
                              'Select Cleaning Status',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700),
                            )
                          : Text(
                              _currentSelectedValue,
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                      value: _currentSelectedValue,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentSelectedValue = newValue!;
                          state.didChange(newValue);
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //       return MyServicesScreen();
                          //     }));
                        });
                      },
                      items: cleaning_status.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
          _currentSelectedValue == 'Dirty'
              ? FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: InputDecorator(
                        decoration: InputDecoration(
                            fillColor: Color(0xff0f9df2).withOpacity(0.9),
                            //filled: true,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Select Dirty Type',
                            //labelText: 'how are you',
                            hintStyle: const TextStyle(
                              color: Colors.black87,
                              backgroundColor: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(7.0))),
                        isEmpty: _currentSelectedValue1 == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: _currentSelectedValue1 == null
                                ? const Text(
                                    'Select Dirty Type',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700),
                                  )
                                : Text(
                                    _currentSelectedValue1,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                            value: _currentSelectedValue1,
                            isDense: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _currentSelectedValue1 = newValue!;
                                state.didChange(newValue);
                              });
                            },
                            items: dirty_type.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(),
          SizedBox(
            height: 40,
            width: 230,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
              ),
              onPressed: () {
                if (_currentSelectedValue == null ||
                    (_currentSelectedValue == 'Dirty' &&
                        _currentSelectedValue1 == null)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
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
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AssignEmployToRoom(
                        requestUid: request1,
                        department: 'Housekeeping',
                        manager_name: mang_name,
                        manager_uid: manage,
                        clean_status: '$_currentSelectedValue',
                        dirty_type: '$_currentSelectedValue1',
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Assign Employ',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
