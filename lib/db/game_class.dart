import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  final String? productDetail;
  final List<String>? linkList;
  final double? price;
  final bool? dropDown;
  final String? detail;

  Game({
    this.productDetail,
    this.linkList,
    this.price,
    this.dropDown,
    this.detail,
  });

//
//ADD
  Future<void> addGames(Game clothesProduct) {
    // Create a CollectionReference called game that references the firestore collection
    CollectionReference game =
        FirebaseFirestore.instance.collection('game');
    //add clothes in game collection
    return game
        .add({
          "productDetail": productDetail,
          "linkList": linkList,
          "price": price!.toDouble(),
          "dropDown": dropDown,
          "detail": detail,
        })
        // ignore: avoid_print
        .then((value) => print("added games"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add games: $error"));
  }
}
