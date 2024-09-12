import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/route_names.dart';
import '../../utils/constants.dart';
import '../../utils/models.dart';
import '../cart_screen/cart_provider.dart';
import '../drawer_screen/drawer.dart';
import 'home_provider.dart';

int notificationsCount = 10;
int cartCount = 20;

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      drawerScrimColor: primaryColor.withOpacity(0.7),
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                routeNotifications,
              );
            },
            icon: Badge.count(
              count: context.watch<HomeProvider>().notificationCount,
              child: const Icon(Icons.notifications),
            ),
          ),
          IconButton(
            onPressed: () {
              // pushToCart(context);
              Navigator.pushNamed(context, routeCart);
            },
            icon: Badge.count(
              count: context.watch<CartProvider>().cartItemsCount,
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const Text('Welcome to the home screen'),
            ElevatedButton(
                onPressed: () =>
                    context.read<HomeProvider>().incrementNotification(),
                child: const Text('Update Notification Count')),
            ElevatedButton(
              onPressed: () => context.read<CartProvider>().addItemToTheCart(
                    CartDataModel(
                      title: 'Burger',
                      image: 'https://hackmd.io/_uploads/rJ-O13knR.png',
                      price: 2,
                      details: '+2 cheese | +1 On',
                      quantity: 1,
                      expanded: false,
                    ),
                  ),
              child: const Text('Add burger to cart'),
            ),
            ElevatedButton(
              onPressed: () => context.read<CartProvider>().addItemToTheCart(
                    CartDataModel(
                      title: 'Pizza',
                      image: 'https://hackmd.io/_uploads/HyTdJnJ3C.png',
                      price: 4,
                      details: '+2 cheese | +1 On',
                      quantity: 1,
                      expanded: false,
                    ),
                  ),
              child: const Text('Add Pizza to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
