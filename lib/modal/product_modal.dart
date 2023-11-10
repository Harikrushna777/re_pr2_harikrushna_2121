import 'package:get/get.dart';

class Product {
  final String title;
  final String description;
  final String brand;
  final int stock;
  final int price;
  final String thumbnail;
  final String category;
  final List images;
  RxInt quntity = 1.obs;

  Product({
    required this.title,
    required this.description,
    required this.brand,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.category,
    required this.images,
  });

  factory Product.fromMap({required Map data}) {
    return Product(
      title: data['title'],
      description: data['description'],
      brand: data['brand'],
      stock: data['stock'],
      price: data['price'],
      thumbnail: data['thumbnail'],
      category: data['category'],
      images: data['images'],
    );
  }
}

class ThemeModel {
  RxBool theme = true.obs;
}
