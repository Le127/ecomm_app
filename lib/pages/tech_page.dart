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
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Tech Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.deepPurple.shade300.withOpacity(0.9),
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
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.8,
                    physics: const BouncingScrollPhysics(),
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
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
