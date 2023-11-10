import 'dart:developer';

import 'package:get/get.dart';

import '../modal/product_modal.dart';

class CartController extends GetxController {
  static RxList<Product> cartItems = <Product>[].obs;
  RxInt totalAmount = 0.obs;
  RxInt productPrice = 0.obs;

  addInCart({required Product product}) {
    cartItems.add(product);
  }

  removeInCart({required Product product}) {
    cartItems.remove(product);
  }

  increseQuntity({required int index}) {
    cartItems[index].quntity++;
    totalAmountPrice();
  }

  decreseQuntity({required int index}) {
    cartItems[index].quntity--;
    if (cartItems[index].quntity < 1) {
      cartItems.removeAt(index);
    }
    totalAmountPrice();
  }

  totalAmountPrice() {
    cartItems.forEach((e) {
      totalAmount(totalAmount.value + e.price);
      log("${totalAmount.value}");
    });
  }
}
