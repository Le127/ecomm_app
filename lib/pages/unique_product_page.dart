import 'package:flutter/material.dart';
import 'package:ecomm_app/widget/product_card.dart';

class UniqueProductPage extends StatelessWidget {
  final List<String> urlImage;

  const UniqueProductPage({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductCard(link: urlImage);
  }
}
