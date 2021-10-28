import 'package:ecomm_app/widget/product_simple_view.dart';
import 'package:flutter/material.dart';

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
        title: const Text("Clothing Page"),
      ),
      body: Center(
        child: SizedBox(
          width: widthSize,
          // height: heightSize,
          //constraints: BoxConstraints(minWidth: minWidth, minHeight: minHeight),

          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 0.8,
                shrinkWrap: true,
                children: const [
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                  ProductSimpleView(
                    urlImage:
                        "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                    otherUrlImage: [
                      "https://http2.mlstatic.com/D_NQ_NP_682844-MLA47517377636_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_786969-MLA47560237400_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_796991-MLA47480511712_092021-O.webp",
                      "https://http2.mlstatic.com/D_NQ_NP_918559-MLA45861441541_052021-O.webp"
                    ],
                    productDetail: "Sponje Bob T-shirt",
                    price: 9.99,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
