import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../../utils/models.dart';
import 'cart_item.dart';
import 'cart_provider.dart';
import 'checkout_section.dart';
import 'recommended_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.green[100],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: IconButton(
              onPressed: () {
                context.read<CartProvider>().clearCart();
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       title: const Text('Delete All'),
                //       content:
                //           const Text('Are you sure you want to delete all?'),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: const Text('Cancel'),
                //         ),
                //         TextButton(
                //           onPressed: () {
                //             Navigator.pop(context);
                //           },
                //           child: const Text('Delete'),
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: const CartBody(),
    );
  }
}

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Delivery',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: ' House, ',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: 'King Abdallah 1st stree',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                  text: 'Your order will be ready in',
                                ),
                                TextSpan(
                                  text: ' 30 to 40 minutes',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        ' 65 SAR ',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: 0.6,
                      minHeight: 8,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: '30 SAR ',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          TextSpan(
                            text: ' Remaining to get free delivery',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...(context.watch<CartProvider>().cartDataList)
                        .map(
                          (item) => CartItemComponent(
                            item: item,
                          ),
                        )
                        .toList(),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.purple[400]),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        minimumSize: WidgetStateProperty.all(
                          Size(MediaQuery.sizeOf(context).width, 50),
                        ),
                      ),
                      child: const Text(
                        'Add Rewards',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const BoldTextItem('Recommended items'),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      // width: MediaQuery.sizeOf(context).width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        children: [
                          ...(context
                                  .watch<CartProvider>()
                                  .recommendedItemsList)
                              .map(
                                (e) => RecommendedItem(
                                  title: e.title,
                                  image: e.image,
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const BoldTextItem('Order Time'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CartButton(
                          'Now',
                          withBorder: true,
                        ),
                        CartButton('Later'),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      shadowColor: Colors.white,
                      child: SizedBox(
                        height: 50,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.purple,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '24-10-1623 - 12:00 PM',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const BoldTextItem('Delivery Note'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      shadowColor: Colors.white,
                      child: SizedBox(
                        height: 150,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Add a note to your order',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          child: CheckoutSection(),
        ),
      ],
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton(
    this.title, {
    this.bgColor,
    this.withBorder = false,
    super.key,
  });

  final String? title;
  final Color? bgColor;
  final bool? withBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
        backgroundColor: withBorder!
            ? null
            : WidgetStateProperty.all((bgColor ?? primaryColor)),
        minimumSize: WidgetStateProperty.all(
          Size(MediaQuery.sizeOf(context).width * 0.4, 50),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: withBorder!
                ? const BorderSide(
                    color: primaryColor,
                  )
                : BorderSide.none,
          ),
        ),
      ),
      child: Text(
        title ?? '',
        style: TextStyle(
          color: withBorder! ? primaryColor : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BoldTextItem extends StatelessWidget {
  const BoldTextItem(
    this.text, {
    super.key,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
