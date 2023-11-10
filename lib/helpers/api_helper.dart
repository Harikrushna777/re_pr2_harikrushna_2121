import 'package:dio/dio.dart';
import '../modal/product_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();
  String api = "https://dummyjson.com/products?limit=100";

  Dio dio = Dio();

  Future<List<Product>?> getData() async {
    Response response = await dio.get(api);
    if (response.statusCode == 200) {
      List allData = response.data['products'];
      List<Product> allProducts =
          allData.map((e) => Product.fromMap(data: e)).toList();
      return allProducts;
    } else {
      return null;
    }
  }
}
