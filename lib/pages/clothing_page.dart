import 'package:ecomm_app/widget/product_card.dart';
import 'package:flutter/material.dart';

class ClothingPage extends StatelessWidget {
  const ClothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ProductCard(),
    );
  }
}
