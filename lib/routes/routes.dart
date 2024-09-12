import 'package:flutter/material.dart';

import '../screens/cart_screen/cart_screen.dart';
import '../screens/home_screen/home.dart';
import '../screens/notifications_screen/notifications.dart';
import 'route_names.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (context) => const MyHome(),
  routeHome: (context) => const MyHome(),
  routeNotifications: (context) => NotificationsScreen(),
  routeCart: (context) => const Cart(),
};

Route<dynamic>? Function(RouteSettings)? unknownRoute =
    (settings) => MaterialPageRoute(
          builder: (context) => const MyHome(),
        );
