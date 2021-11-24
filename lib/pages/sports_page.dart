import 'package:ecomm_app/db/sports_class.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_app/widget/product_simple_view.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = 350;

    if (size.width >= 1091 && size.height >= 624) {
      widthSize = 400;
    }

    CollectionReference sports =
        FirebaseFirestore.instance.collection('sports');

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      floatingActionButton: FloatingActionButton(onPressed: () {
        final clothes = Sports(
            linkList: [
              "https://m.media-amazon.com/images/I/5174IefYCuL._AC_SL1279_.jpg",
              "https://m.media-amazon.com/images/I/51YMSRhnx-L._AC_SL1279_.jpg",
              "https://m.media-amazon.com/images/I/51s04BWx0XL._AC_SL1279_.jpg",
            ],
            name: 'Arena Soft Latex Unisex Swim Cap for Women and Men',
            price: 8.57,
            dropDown: false,
            detail:
                "made of soft, 100% latex for a waterproof, secure fit. Extra durable and won't snag hair. Edge design resists rolling, protects hair from pool chemicals and uv rays");

        clothes.addSport(clothes);
      }),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Sports Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.shade300.withOpacity(0.9),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: sports.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              List<Sports> getSportsFromQuery(QuerySnapshot snapshot) {
                return snapshot.docs.map((DocumentSnapshot doc) {
                  return Sports(
                      linkList: [...doc['linkList']],
                      name: doc['name'],
                      price: doc['price'].toDouble(),
                      dropDown: doc['dropDown'],
                      detail: doc['detail']);
                }).toList();
              }

              final listSports = getSportsFromQuery(snapshot.data!);

              return Center(
                child: SizedBox(
                  width: widthSize,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 0.8,
                      shrinkWrap: true,
                      children: [
                        ...listSports
                            .map((e) => ProductSimpleView(
                                linkList: e.linkList!,
                                productDetail: e.name!,
                                price: e.price!,
                                dropDown: e.dropDown!,
                                detail: e.detail))
                            .toList()
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

/* 
ProductSimpleView(
                      linkList: [
                        "https://http2.mlstatic.com/D_NQ_NP_961259-MLA44947773152_022021-O.webp",
                        "https://http2.mlstatic.com/D_NQ_NP_960999-MLA44947762765_022021-O.webp",
                        "https://http2.mlstatic.com/D_NQ_NP_960678-MLA44947777048_022021-O.webp",
                      ],
                      productDetail: "Soccer Ball No. 5 Umbro Neo",
                      price: 26.99,
                    ), */
