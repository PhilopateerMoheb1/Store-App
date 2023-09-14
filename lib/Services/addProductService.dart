import 'package:storeapp/Models/getAllProductsModel.dart';
import 'package:storeapp/helper/api.dart';

class AddProduct {
  Future<GetAllProductsModel> addProduct(
      {required String title,
      required String price,
      required String descp,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await api().post(
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
