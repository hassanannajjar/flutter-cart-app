import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';
import 'screens/cart_screen/cart_provider.dart';
import 'screens/home_screen/home_provider.dart';
import 'screens/notifications_screen/notifications_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        // ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(create: (context) => NotificationsProvider()),
      ],
      child: MaterialApp(
        routes: routes,
        // just for web
        onUnknownRoute: unknownRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
