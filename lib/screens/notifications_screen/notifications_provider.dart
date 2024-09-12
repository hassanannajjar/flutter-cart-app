import 'package:flutter/material.dart';

class NotificationsProvider extends ChangeNotifier {
  String myName = 'John Doe';

  void changeName(String name) {
    myName = name;
    notifyListeners();
  }
}
