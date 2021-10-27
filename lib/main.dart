import 'package:ecomm_app/pages/accessory_page.dart';
import 'package:ecomm_app/pages/game_page.dart';
import 'package:ecomm_app/pages/tech_page.dart';
import 'package:flutter/material.dart';

import 'package:ecomm_app/pages/all_products_page.dart';
import 'package:ecomm_app/pages/clothing_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecomm App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ecomm App Bar'),
        ),
      ),
      initialRoute: "allProducts",
      routes: {
        "allProducts": (_) => const AllProductsPage(),
        "clothing": (_) => const ClothingPage(),
        "tech": (_) => const TechPage(),
        "accessory": (_) => const AccessoryPage(),
        "game": (_) => const GamePage(),
      },
    );
  }
}
