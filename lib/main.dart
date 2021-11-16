import 'package:ecomm_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import "dart:developer" as developer;

import 'package:ecomm_app/pages/auth_page.dart';
import 'package:ecomm_app/pages/register_page.dart';
import 'package:ecomm_app/pages/unique_product_page.dart';
import 'package:ecomm_app/pages/all_products_page.dart';
import 'package:ecomm_app/pages/clothing_page.dart';
import 'package:ecomm_app/pages/sports_page.dart';
import 'package:ecomm_app/pages/game_page.dart';
import 'package:ecomm_app/pages/tech_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp>? snapshot) {
        if (snapshot!.hasError) {
          developer.log("Main , Firebase init. ERROR");
          return const Text(
            "Error firebase",
            textDirection: TextDirection.ltr,
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          developer.log("Main , Firebase init. DONE OK!");
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
            initialRoute: "login",
            routes: {
              "allProducts": (_) => const AllProductsPage(),
              "clothing": (_) => const ClothingPage(),
              "tech": (_) => const TechPage(),
              "sports": (_) => const SportsPage(),
              "game": (_) => const GamePage(),
              "uniqueProduct": (_) => const UniqueProductPage(urlImage: []),
              "auth": (_) => AuthPage(),
              "register": (_)=> const RegisterPage(),
              "login" : (_)=>const LoginPage(),
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
