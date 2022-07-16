import 'dart:collection';

import 'package:flutter/material.dart';


class NotificationProvider extends ChangeNotifier{
List<String> _ml=[];

UnmodifiableListView<String> get ml=>UnmodifiableListView(_ml);

addManager(String deviceId){
  _ml.add(deviceId);

  notifyListeners();
}


clearList(){
  _ml.clear();
}
}