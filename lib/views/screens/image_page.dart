import 'dart:developer';

import 'package:flutter/material.dart';

import '../../modal/product_modal.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    log("Images: ${product.images}");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Images",
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
        child: Center(
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(10.0),
            minScale: 0.05,
            maxScale: 8.0,
            child: ListView.builder(
              itemCount: product.images.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(5),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(product.images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
