import 'package:flutter/material.dart';
import 'package:storeapp/Pages/home_page.dart';

void main() {
  runApp(const StoreApp());
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
      },
      initialRoute: const HomePage().id,
    );
  }
}
