import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/cubits/getallproducts/get_all_products_cubit.dart';

import '../Widgets/ViewPageAllProductHomePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
        child: BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
          builder: (context, state) {
            if (state is GetAllProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetAllProductsSuccess) {
              return ViewAllProductsInHomePage(
                state: state,
              );
            } else {
              return const Text("Failed mother fucker");
            }
          },
        ),
      ),
    );
  }
}
