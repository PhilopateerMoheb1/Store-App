// ignore_for_file: file_names

import '../Models/getAllProductsModel.dart';
import '../helper/api.dart';

class UpdateProductService {
  Future<GetAllProductsModel> addProduct({
    required String title,
    required String price,
    required String descp,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await api().put(
      url: "https://fakestoreapi.com/products",
      body: {
        "title": title,
        "price": price,
        "description": descp,
        "image": image,
        "category": category,
      },
    );
    return GetAllProductsModel.fromJson(data);
  }
}
