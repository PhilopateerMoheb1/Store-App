import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:storeapp/Models/getAllProductsModel.dart';
import 'package:storeapp/helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllProducts() async {
    try {
      List<dynamic> data =
          await api().get(url: "https://fakestoreapi.com/products/categories");
      return data;
    } on Exception catch (e) {
      return [];
    }
  }
}
