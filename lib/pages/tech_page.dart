import 'package:ecomm_app/db/tech_class.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_app/widget/product_simple_view.dart';

class TechPage extends StatelessWidget {
  const TechPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = 350;

    if (size.width >= 1091 && size.height >= 624) {
      widthSize = 400;
    }

    CollectionReference sports = FirebaseFirestore.instance.collection('tech');

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        final tech = Tech(
            linkList: [
              "https://http2.mlstatic.com/D_NQ_NP_2X_677829-MLA44848722040_022021-F.webp",
              "https://http2.mlstatic.com/D_NQ_NP_2X_770306-MLA44848256929_022021-F.webp",
              "https://http2.mlstatic.com/D_NQ_NP_2X_975863-MLA44848256930_022021-F.webp",
              "https://http2.mlstatic.com/D_NQ_NP_2X_748918-MLA44848256931_022021-F.webp"
            ],
            name: "Samsung Galaxy S21",
            price: 799.99,
            dropDown: false,
            detail:
                "Business ready, right out of the box: Our best devices — now paired with a complete package of business-ready services. Samsung Galaxy Enterprise Edition is designed for end-to-end management, backed with years of security and specifically put on a longer lifecycle.");

        tech.addTech(tech);
      }),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Tech Page",
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
              List<Tech> getTechFromQuery(QuerySnapshot snapshot) {
                return snapshot.docs.map((DocumentSnapshot doc) {
                  return Tech(
                      linkList: [...doc['linkList']],
                      name: doc['name'],
                      price: doc['price'].toDouble(),
                      dropDown: doc['dropDown'],
                      detail: doc['detail']);
                }).toList();
              }

              final listTech = getTechFromQuery(snapshot.data!);

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
                        ...listTech
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
