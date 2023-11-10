import 'package:get/get.dart';

import '../modal/product_modal.dart';

class FavoriteController extends GetxController {
  static RxList<Product> favoriteItems = <Product>[].obs;

  addInFavorite({required Product product}) {
    favoriteItems.add(product);
  }

  removeInFavorite({required int product}) {
    favoriteItems.removeAt(product);
  }
}
