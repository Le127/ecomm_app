import 'package:cloud_firestore/cloud_firestore.dart';

class Clothings {
  final String? productDetail;
  final List<String>? linkList;
  final double? price;
  final bool? dropDown;
  final List<String>? dropDownValues;

  Clothings({
    this.productDetail,
    this.linkList,
    this.price,
    this.dropDown,
    this.dropDownValues,
  });

//
//ADD
  Future<void> addClothes(Clothings clothesProduct) {
    // Create a CollectionReference called clothings that references the firestore collection
    CollectionReference clothings =
        FirebaseFirestore.instance.collection('clothings');
    //add clothes in clothings collection
    return clothings
        .add({
          "productDetail": productDetail,
          "linkList": linkList,
          "price": price!.toDouble(),
          "dropDown": dropDown,
          "dropDownValues": dropDownValues,
        })
        // ignore: avoid_print
        .then((value) => print("added clothes"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add clothes: $error"));
  }
}
