import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
//primera de la lista
  String urlImage =
      "https://http2.mlstatic.com/D_NQ_NP_612012-MLA47560182865_092021-O.webp";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: 350,
      height: 500,
      child: Card(
        color: Colors.red,
        child: Column(
          children: [
            const SizedBox(height: 5),
            Image.network(urlImage, width: 250, height: 250),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    child: Image.network(
                        "https://http2.mlstatic.com/D_NQ_NP_612012-MLA47560182865_092021-O.webp",
                        width: 50,
                        height: 50),
                    onTap: () => setState(() {
                          urlImage =
                              "https://http2.mlstatic.com/D_NQ_NP_612012-MLA47560182865_092021-O.webp";
                        })),
                GestureDetector(
                    child: Image.network(
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                        width: 50,
                        height: 50),
                    onTap: () => setState(() {
                          urlImage =
                              "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp";
                        })),
                Image.network(
                    "https://http2.mlstatic.com/D_NQ_NP_612012-MLA47560182865_092021-O.webp",
                    width: 50,
                    height: 50),
                Image.network(
                    "https://http2.mlstatic.com/D_NQ_NP_612012-MLA47560182865_092021-O.webp",
                    width: 50,
                    height: 50),
                Image.network(
                    "https://http2.mlstatic.com/D_NQ_NP_612012-MLA47560182865_092021-O.webp",
                    width: 50,
                    height: 50),
                Image.network(
                    "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    width: 50,
                    height: 50),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Remera Top full"),
            const SizedBox(height: 10),
            const Text("Price  \$201"),
            const SizedBox(height: 10),
            const Text("Talle : XL"),
          ],
        ),
      ),
    );
  }
}
