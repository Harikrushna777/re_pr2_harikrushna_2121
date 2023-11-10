import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/favorite_controller.dart';
import '../../modal/product_modal.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
          return ListView.builder(
            itemCount: FavoriteController.favoriteItems.length,
            itemBuilder: (context, index) {
              Product product = FavoriteController.favoriteItems[index];
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
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          favoriteController.removeInFavorite(product: index);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
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
      backgroundColor: Colors.black,
    );
  }
}
