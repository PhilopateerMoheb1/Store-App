import 'dart:convert';

import 'package:dio/dio.dart';

import '../Models/getAllProductsModel.dart';
import '../helper/api.dart';

class GetAllProductsFromEachCategory {
  Future<List<GetAllProductsModel>> getCategoryAllProducts(
      String categoryName) async {
    try {
      List<dynamic> data = await api().get(
        url: 'https://fakestoreapi.com/products/category/$categoryName',
      );

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
