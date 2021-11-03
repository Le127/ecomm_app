import 'package:cloud_firestore/cloud_firestore.dart';

class Sports {
  final String? name;
  final List<String>? linkList;
  final double? price;
  final bool? dropDown;
  final List<String>? dropDownValues;

  Sports({
    this.name,
    this.linkList,
    this.price,
    this.dropDown,
    this.dropDownValues,
  });

//
//ADD
  Future<void> addSport(Sports sportsProduct) {
    // Create a CollectionReference called sports that references the firestore collection
    CollectionReference sports =
        FirebaseFirestore.instance.collection('sports');
    //add clothes in sports collection
    return sports
        .add({
          "name": name,
          "linkList": linkList,
          "price": price!.toDouble(),
          "dropDown": dropDown,
          "dropDownValues": dropDownValues,
        })
        // ignore: avoid_print
        .then((value) => print("added sports"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add clothes: $error"));
  }
}
