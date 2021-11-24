import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecomm_app/db/clothing_class.dart';

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

    CollectionReference clothings =
        FirebaseFirestore.instance.collection('clothings');

    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Clothing Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow.shade300.withOpacity(0.9),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: clothings.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<Clothings> getClothingsFromQuery(QuerySnapshot snapshot) {
              return snapshot.docs.map((DocumentSnapshot doc) {
                return Clothings(
                    linkList: [...doc['linkList']],
                    productDetail: doc['productDetail'],
                    price: doc['price'].toDouble(),
                    dropDown: doc['dropDown'],
                    dropDownValues: [...doc['dropDownValues']]);
              }).toList();
            }

            final listClothings = getClothingsFromQuery(snapshot.data!);

            return Center(
              child: SizedBox(
                width: widthSize,
                child: GridView.count(
                    padding: const EdgeInsets.only(top: 20),
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.8,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...listClothings
                          .map((e) => ProductSimpleView(
                                linkList: e.linkList!,
                                productDetail: e.productDetail!,
                                price: e.price!,
                                dropDown: e.dropDown!,
                                dropDownValues: e.dropDownValues,
                              ))
                          .toList()
                    ]),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
