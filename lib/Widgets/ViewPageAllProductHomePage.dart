import 'package:flutter/material.dart';

import '../cubits/getallproducts/get_all_products_cubit.dart';
import 'CustomCard.dart';

class ViewAllProductsInHomePage extends StatelessWidget {
  const ViewAllProductsInHomePage({
    super.key,
    required this.state,
  });

  final GetAllProductsSuccess state;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: state.products.length,
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return CustomCard(
          productsModel: state.products[index],
        );
      },
    );
  }
}
