import 'package:flutter/material.dart';
import 'package:ecomm_app/pages/unique_product_page.dart';

class ProductSimpleView extends StatelessWidget {
  final String productDetail;
  final List<String> linkList;
  final double price;
  final bool? dropDown;
  final List<String>? dropDownValues;
  final String? detail;

  const ProductSimpleView({
    Key? key,
    required this.productDetail,
    required this.price,
    this.linkList = const [],
    this.dropDown,
    this.dropDownValues,
    this.detail,
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
          builder: (_) => UniqueProductPage(
              urlImage: linkList,
              detailName: productDetail,
              price: price,
              dropDown: dropDown,
              dropDownValues: dropDownValues,
              detail: detail),
        ),
      ),
      child: Card(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Image.network(linkList[0], width: 175, height: 175)),
            const SizedBox(height: 5),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(productDetail, textAlign: TextAlign.center),
            )),
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
