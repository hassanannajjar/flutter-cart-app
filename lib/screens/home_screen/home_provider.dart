import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int notificationCount = 0;
  int cartItemsCount = 0;

  void incrementNotification() {
    notificationCount++;
    notifyListeners();
  }

  void updateCartItemsCount(int count) {
    cartItemsCount = count;
    notifyListeners();
  }
}
