import 'package:ecomm_app/widget/product_simple_view.dart';
import 'package:flutter/material.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = 350;

    if (size.width >= 1091 && size.height >= 624) {
      widthSize = 400;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Accessory Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.shade300.withOpacity(0.9),
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
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_961259-MLA44947773152_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960999-MLA44947762765_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960678-MLA44947777048_022021-O.webp",
                  ],
                  productDetail: "Soccer Ball No. 5 Umbro Neo",
                  price: 26.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_757009-MLA46582195155_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_930586-MLA46582043771_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_786373-MLA31095682546_062019-O.webp",
                  ],
                  productDetail: "Molten Gr7 Basketball Ball",
                  price: 7.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_961259-MLA44947773152_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960999-MLA44947762765_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960678-MLA44947777048_022021-O.webp",
                  ],
                  productDetail: "Soccer Ball No. 5 Umbro Neo",
                  price: 21.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_757009-MLA46582195155_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_930586-MLA46582043771_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_786373-MLA31095682546_062019-O.webp",
                  ],
                  productDetail: "Molten Gr7 Basketball Ball",
                  price: 15.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_961259-MLA44947773152_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960999-MLA44947762765_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960678-MLA44947777048_022021-O.webp",
                  ],
                  productDetail: "Soccer Ball No. 5 Umbro Neo",
                  price: 20.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_757009-MLA46582195155_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_930586-MLA46582043771_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_786373-MLA31095682546_062019-O.webp",
                  ],
                  productDetail: "Molten Gr7 Basketball Ball",
                  price: 26.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_961259-MLA44947773152_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960999-MLA44947762765_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960678-MLA44947777048_022021-O.webp",
                  ],
                  productDetail: "Soccer Ball No. 5 Umbro Neo",
                  price: 26.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_757009-MLA46582195155_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_930586-MLA46582043771_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_786373-MLA31095682546_062019-O.webp",
                  ],
                  productDetail: "Molten Gr7 Basketball Ball",
                  price: 13.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_961259-MLA44947773152_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960999-MLA44947762765_022021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_960678-MLA44947777048_022021-O.webp",
                  ],
                  productDetail: "Soccer Ball No. 5 Umbro Neo",
                  price: 26.99,
                ),
                ProductSimpleView(
                  linkList: [
                    "https://http2.mlstatic.com/D_NQ_NP_757009-MLA46582195155_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_930586-MLA46582043771_072021-O.webp",
                    "https://http2.mlstatic.com/D_NQ_NP_786373-MLA31095682546_062019-O.webp",
                  ],
                  productDetail: "Molten Gr7 Basketball Ball",
                  price: 26.99,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
