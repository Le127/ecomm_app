import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ecomm_app/pages/unique_product_page.dart';
import 'package:ecomm_app/pages/all_products_page.dart';
import 'package:ecomm_app/pages/clothing_page.dart';
import 'package:ecomm_app/pages/sports_page.dart';
import 'package:ecomm_app/pages/game_page.dart';
import 'package:ecomm_app/pages/tech_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String get name => 'ecommflutter';

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
      apiKey: "AIzaSyAa9fV9zuijX-M9N10Z1kc3tLric9Vxw7M",
      authDomain: "ecommflutter-f5351.firebaseapp.com",
      projectId: "ecommflutter-f5351",
      storageBucket: "ecommflutter-f5351.appspot.com",
      messagingSenderId: "194768273496",
      appId: "1:194768273496:web:acbbcafd368190c404ca2d");

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    // ignore: unnecessary_null_comparison
    assert(app != null);
    // ignore: avoid_print
    print('Initialized default app $app');
  }

  Future<void> initializeSecondary() async {
    FirebaseApp app =
        await Firebase.initializeApp(name: name, options: firebaseOptions);

    // ignore: unnecessary_null_comparison
    assert(app != null);
    // ignore: avoid_print
    print('Initialized $app');
  }

  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    // ignore: avoid_print
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions options = app.options;
    // ignore: avoid_print
    print('Current options for app $name: $options');
  }

  Future<void> delete() async {
    final FirebaseApp app = Firebase.app(name);
    await app.delete();
    // ignore: avoid_print
    print('App $name deleted');
  }

  @override
  void initState() {
    initializeDefault();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecomm App',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Ecomm App Bar'),
          ),
        ),
      ),
      initialRoute: "allProducts",
      routes: {
        "allProducts": (_) => const AllProductsPage(),
        "clothing": (_) => const ClothingPage(),
        "tech": (_) => const TechPage(),
        "sports": (_) => const SportsPage(),
        "game": (_) => const GamePage(),
        "uniqueProduct": (_) => const UniqueProductPage(urlImage: []),
      },
    );
  }
}
