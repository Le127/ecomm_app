import 'package:ecomm_app/db/game_class.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecomm_app/widget/product_simple_view.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double widthSize = 350;

    if (size.width >= 1091 && size.height >= 624) {
      widthSize = 400;
    }

    CollectionReference games = FirebaseFirestore.instance.collection('game');

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      floatingActionButton: FloatingActionButton(onPressed: () {
        final game = Game(
            productDetail: "Monitor gamer",
            linkList: [
              "https://http2.mlstatic.com/D_NQ_NP_664672-MLA46351142917_062021-O.webp",
              "https://http2.mlstatic.com/D_NQ_NP_833344-MLA46351250473_062021-O.webp",
              "https://http2.mlstatic.com/D_NQ_NP_981998-MLA46351142920_062021-O.webp",
            ],
            price: 34.999,
            dropDown: false,
            detail: 'Monitor gamer AOpen MH1 25MH1Q P led 25'' negro 100V/240V');

        game.addGames(game);
      }),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Game Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.shade300.withOpacity(0.9),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: games.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<Game> getGamesFromQuery(QuerySnapshot snapshot) {
              return snapshot.docs.map((DocumentSnapshot doc) {
                return Game(
                    linkList: [...doc['linkList']],
                    productDetail: doc['productDetail'],
                    price: doc['price'].toDouble(),
                    dropDown: doc['dropDown'],
                    detail: doc['detail']);
              }).toList();
            }

            final listGames = getGamesFromQuery(snapshot.data!);

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
                      ...listGames
                          .map((e) => ProductSimpleView(
                                linkList: e.linkList!,
                                productDetail: e.productDetail!,
                                price: e.price!,
                                dropDown: e.dropDown!,
                                detail: e.detail,
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
