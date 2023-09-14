import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:storeapp/Models/getAllProductsModel.dart';
import 'package:storeapp/helper/api.dart';

class GetAllProductsService {
  Future<List<GetAllProductsModel>> getAllProducts() async {
    try {
      List<dynamic> data =
          await api().get(url: "https://fakestoreapi.com/products");
      List<GetAllProductsModel> products = [];
      for (var i = 0; i < data.length; i++) {
        products.add(GetAllProductsModel.fromJson(data[i]));
      }
      return products;
    } on Exception catch (e) {
      return [];
    }
  }
}
