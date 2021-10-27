import 'package:ecomm_app/widget/product_card.dart';
import 'package:flutter/material.dart';

class ClothingPage extends StatelessWidget {
  const ClothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ProductCard(
        link: [
          "https://http2.mlstatic.com/D_NQ_NP_612012-MLA47560182865_092021-O.webp",
          "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp"
        ],
      ),
    );
  }
}
