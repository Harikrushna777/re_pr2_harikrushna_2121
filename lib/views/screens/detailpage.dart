import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/favorite_controller.dart';
import '../../modal/product_modal.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  CartController cartController = Get.put(CartController());
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (FavoriteController.favoriteItems.contains(product)) {
                Get.snackbar(
                  "This Product Already Add in Favorite List.",
                  "Product :- ${product.title}",
                  snackPosition: SnackPosition.BOTTOM,
                  borderRadius: 10,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
                Get.toNamed("/favorite_page", arguments: product);
              } else {
                favoriteController.addInFavorite(product: product);
                Get.snackbar(
                  "This Product is add in Cart List.",
                  "Product :- ${product.title}",
                  snackPosition: SnackPosition.BOTTOM,
                  borderRadius: 10,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                Get.toNamed("/favorite_page", arguments: product);
              }
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              if (CartController.cartItems.contains(product)) {
                Get.snackbar(
                  "This Product Already Add in Cart List.",
                  "Product :- ${product.title}",
                  snackPosition: SnackPosition.BOTTOM,
                  borderRadius: 10,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
                Get.toNamed("/cart_page", arguments: product);
              } else {
                cartController.addInCart(product: product);
                product.quntity = 1.obs;
                Get.snackbar(
                  "This Product is add in Cart List.",
                  "Product :- ${product.title}",
                  snackPosition: SnackPosition.BOTTOM,
                  borderRadius: 10,
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                Get.toNamed("/cart_page", arguments: product);
              }
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                disableGesture: true,
                items: List.generate(
                  product.images.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Get.toNamed("/image_page", arguments: product);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(product.images[index]),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  animateToClosest: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2 / 2,
                  autoPlay: true,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company        :-     ${product.brand}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Name                 :-     ${product.title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Price                  :-     ${product.price}",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Stock                 :-     ${product.stock}",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Category           :-     ${product.category}",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "-: Information :-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "-------------------------------------------",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          product.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed("/cart_page", arguments: product);
                              },
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
