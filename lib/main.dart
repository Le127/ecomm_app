import 'package:flutter/material.dart';

import 'package:ecomm_app/pages/unique_product_page.dart';
import 'package:ecomm_app/pages/all_products_page.dart';
import 'package:ecomm_app/pages/clothing_page.dart';
import 'package:ecomm_app/pages/sports_page.dart';
import 'package:ecomm_app/pages/game_page.dart';
import 'package:ecomm_app/pages/tech_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecomm App',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Ecomm App Bar'),
          ),
        ),
      ),
      initialRoute: "allProducts",
      routes: {
        "allProducts": (_) => const AllProductsPage(),
        "clothing": (_) => const ClothingPage(),
        "tech": (_) => const TechPage(),
        "sports": (_) => const SportsPage(),
        "game": (_) => const GamePage(),
        "uniqueProduct": (_) => const UniqueProductPage(urlImage: []),
      },
    );
  }
}
