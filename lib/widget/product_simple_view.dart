import 'package:flutter/material.dart';
import 'package:ecomm_app/pages/unique_product_page.dart';

class ProductSimpleView extends StatelessWidget {
  final String urlImage;
  final String productDetail;
  final List<String> otherUrlImage;
  final double price;

  const ProductSimpleView({
    Key? key,
    required this.urlImage,
    required this.productDetail,
    required this.price,
    this.otherUrlImage = const [],
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    // double widthSize = 200;
    //double heightSize = 250;
    //  double minWidth = 150;
    // double minHeight = 150;

    /*  if (size.width >= 1091 && size.height >= 624) {
      widthSize = 200;
      heightSize = 100;
    } */
/*     if (size.width >= 340 && size.height >= 640) {
      minWidth = 150;
      minHeight = 150;
      widthSize = 150;
      heightSize = 150;
    } */

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => UniqueProductPage(urlImage: otherUrlImage))),
      child: Card(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Image.network(urlImage, width: 175, height: 175)),
            const SizedBox(height: 5),
            Expanded(child: Text(productDetail)),
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: Text("\$ " + price.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
