import 'dart:convert';

class GetAllProductsModel {
  final int id;
  final String title;
  final String? descrp;
  final dynamic price;
  final String category;
  final String urlImg;
  final RatingModel ratingModel;

  GetAllProductsModel(
      {required this.id,
      required this.title,
      this.descrp,
      required this.price,
      required this.category,
      required this.urlImg,
      required this.ratingModel});

  factory GetAllProductsModel.fromJson(jsonData) {
    return GetAllProductsModel(
        id: jsonData["id"],
        title: jsonData["title"],
        price: jsonData["price"],
        category: jsonData["category"],
        urlImg: jsonData["image"],
        ratingModel: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;
  const RatingModel({
    required this.count,
    required this.rate,
  });
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData["rate"]);
  }
}
