import 'package:flutter/material.dart';

import '../../utils/models.dart';

class CartProvider extends ChangeNotifier {
  int totalPrice = 0;
  int cartItemsCount = 0;

  List<CartDataModel> cartDataList = <CartDataModel>[];

  //  CartDataModel(
  //     title: 'Burger',
  //     image: 'https://hackmd.io/_uploads/rJ-O13knR.png',
  //     price: 2,
  //     details: '+2 cheese | +1 On',
  //     quantity: 1,
  //     expanded: false,
  //   ),
  //   CartDataModel(
  //     title: 'Pizza',
  //     image: 'https://hackmd.io/_uploads/HyTdJnJ3C.png',
  //     price: 4,
  //     details: '+2 cheese | +1 On',
  //     quantity: 1,
  //     expanded: false,
  //   ),
  //   CartDataModel(
  //     title: 'Pasta',
  //     image: 'https://hackmd.io/_uploads/BySayn12C.png',
  //     price: 3,
  //     details: '+2 cheese | +1 On \n+2 cheese | +1 On \n+2 cheese | +1 On',
  //     quantity: 1,
  //     expanded: true,
  //   ),
  //   CartDataModel(
  //     title: 'Salad',
  //     image: 'https://hackmd.io/_uploads/BJtAyhknC.png',
  //     price: 5,
  //     details: '+2 cheese | +1 On',
  //     quantity: 1,
  //     expanded: false,
  //   ),

  List<RecommendedItemModel> recommendedItemsList = <RecommendedItemModel>[
    RecommendedItemModel(
      title: 'Burger',
      image: 'https://hackmd.io/_uploads/BygiJhkhA.png',
    ),
    RecommendedItemModel(
      title: 'Pizza',
      image: 'https://hackmd.io/_uploads/r1ijyhyn0.png',
    ),
    RecommendedItemModel(
      title: 'Pasta',
      image: 'https://hackmd.io/_uploads/H1Vlenk3C.png',
    ),
    RecommendedItemModel(
      title: 'Salad',
      image: 'https://hackmd.io/_uploads/SyxMghyhR.png',
    ),
  ];

  // Increase quantity of an item in the cart
  void increaseQuantity(CartDataModel item) {
    item.quantity = item.quantity! + 1; // Increase quantity
    totalPrice += item.price!; // Add item's base price to total
    cartItemsCount++; // Increase cart items count
    notifyListeners(); // Notify listeners of the change
  }

  // Decrease quantity of an item in the cart
  void decreaseQuantity(CartDataModel item) {
    if (item.quantity! > 1) {
      // Ensure quantity doesn't go below 1
      item.quantity = item.quantity! - 1; // Decrease quantity
      cartItemsCount--; // Decrease cart items count
      totalPrice -= item.price!; // Subtract item's base price from total
      notifyListeners(); // Notify listeners of the change
    }
  }

  // change the expanded state of an item in the cart
  void changeExpandedState(CartDataModel item) {
    item.expanded = !item.expanded!; // Change expanded state
    notifyListeners(); // Notify listeners of the change
  }

  void addItemToTheCart(CartDataModel item) {
    if (cartDataList
        .where((element) => element.title == item.title)
        .isNotEmpty) {
      final CartDataModel dataItem = cartDataList
          .where((element) => element.title == item.title)
          .toList()[0];
      dataItem.quantity = dataItem.quantity! + 1;
      totalPrice = item.price! + totalPrice;
    } else {
      cartDataList.add(item);
    }
    cartItemsCount = cartDataList.length;
    notifyListeners();

    // cartDataList.add(item);
  }

  void clearCart() {
    cartDataList.clear();
    cartItemsCount = cartDataList.length;
    notifyListeners();
  }

  void removeOneItem() {
    cartDataList.removeLast();
  }
}
