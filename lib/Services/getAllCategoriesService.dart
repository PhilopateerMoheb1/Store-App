// ignore_for_file: file_names

import 'package:storeapp/helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllProducts() async {
    try {
      List<dynamic> data =
          await api().get(url: "https://fakestoreapi.com/products/categories");
      return data;
    } on Exception {
      return [];
    }
  }
}
