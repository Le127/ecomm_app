import 'package:cloud_firestore/cloud_firestore.dart';

class Tech {
  final String? name;
  final List<String>? linkList;
  final double? price;
  final bool? dropDown;
  final String? detail;

  Tech({this.name, this.linkList, this.price, this.dropDown, this.detail});

//
//ADD
  Future<void> addTech(Tech sportsProduct) {
    // Create a CollectionReference called tech that references the firestore collection
    CollectionReference tech = FirebaseFirestore.instance.collection('tech');
    //add clothes in sports collection
    return tech
        .add({
          "name": name,
          "linkList": linkList,
          "price": price!.toDouble(),
          "dropDown": dropDown,
          "detail": detail
        })
        // ignore: avoid_print
        .then((value) => print("added tech"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add tech: $error"));
  }
}
