import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../modal/product_modal.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    cartController.totalAmountPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Obx(() {
                return ListView.builder(
                  itemCount: CartController.cartItems.length,
                  itemBuilder: (context, index) {
                    Product product = CartController.cartItems[index];
                    return Card(
                      borderOnForeground: true,
                      color: Colors.lightBlueAccent,
                      child: ListTile(
                        leading: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(product.thumbnail),
                                fit: BoxFit.cover),
                          ),
                        ),
                        trailing: Obx(() {
                          return Text(
                            "\$${CartController.cartItems[index].price * CartController.cartItems[index].quntity.toInt()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          );
                        }),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "\$${product.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                cartController.increseQuntity(index: index);
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Obx(() {
                              return Text(
                                "${product.quntity}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                            TextButton(
                              onPressed: () {
                                cartController.decreseQuntity(index: index);
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const Spacer(),
            const Text(
              "-: Total Amount :-",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent,
              ),
              child: Obx(() {
                return Text(
                  "${cartController.totalAmount}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
