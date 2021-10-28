import 'package:flutter/material.dart';

import 'package:ecomm_app/widget/product_simple_view.dart';

class ClothingPage extends StatelessWidget {
  const ClothingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  
    double widthSize = 350;

    if (size.width >= 1091 && size.height >= 624) {
      widthSize = 400;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        title: const Text("Clothing Page", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow.shade300.withOpacity(0.9),
      ),
      body: Center(
        child: SizedBox(
          width: widthSize,
          // height: heightSize,
          //constraints: BoxConstraints(minWidth: minWidth, minHeight: minHeight),

          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            physics: const BouncingScrollPhysics(),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.8,
                shrinkWrap: true,
                children: const [
                  ProductSimpleView(
                    linkList: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 10.99,
                    dropDown: true,
                    dropDownValues: ["S", "M", "L", "XL"],
                  ),
                  ProductSimpleView(
                    linkList: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 10.99,
                    dropDown: true,
                    dropDownValues: ["S", "M", "L", "XL"],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
