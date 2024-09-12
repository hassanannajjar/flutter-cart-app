import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: context.read<HomeProvider>().incrementNotification,
            child: const Text('increase')),
      ),
    );
  }
}
