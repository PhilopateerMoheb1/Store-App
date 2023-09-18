import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Pages/Register_Screen.dart';
import 'package:storeapp/Pages/Update_Product_Page.dart';
import 'package:storeapp/Pages/home_page.dart';
import 'package:storeapp/Pages/login_Screen.dart';
import 'package:storeapp/cubits/LoginCubit/login_cubit.dart';
import 'package:storeapp/cubits/RegisterCubit/register_cubit.dart';
import 'package:storeapp/cubits/getallproducts/get_all_products_cubit.dart';

void main() {
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => RegisterCubit()),
      BlocProvider(create: (context) => GetAllProductsCubit()),
    ],
    child: const StoreApp(),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        const HomePage().id: (context) => const HomePage(),
        UpdateProductPage().id: (context) => UpdateProductPage(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
      initialRoute: LoginScreen.id,
    );
  }
}
