// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/Models/getAllProductsModel.dart';
import 'package:storeapp/Services/UpdateProduct.dart';
import 'package:storeapp/Widgets/CustomTextField.dart';
import 'package:storeapp/Widgets/CustomWideButton.dart';

import '../Widgets/CustomNormalTextField.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  final String id = "Update Page";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;

  String? price;

  String? descrption;

  String? image;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    GetAllProductsModel product =
        ModalRoute.of(context)!.settings.arguments as GetAllProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: "Product Name",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      descrption = data;
                    },
                    hintText: "Descrption",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    textInputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    hintText: "Price",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: "Image",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomWideButton(
                    buttonText: "Update",
                    onTap: () async {
                      isloading = true;
                      setState(() {});
                      try {
                        await UpdateProduct(product);

                        isloading = false;
                      } on Exception catch (e) {
                        // TODO
                      }
                      setState(() {});
                      isloading = false;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(GetAllProductsModel? product) async {
    await UpdateProductService().addProduct(
      title: productName ?? product!.title,
      price: price ?? product!.price,
      descp: descrption ?? product!.descrp!,
      image: image ?? product!.urlImg,
      category: product?.category as String,
    );
  }
}
