import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);
  // ignore: unused_field
  final _auth = FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // ignore: avoid_print
      print('User is currently signed out!');
    } else {
      // ignore: avoid_print
      print('User is signed in!');
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                try {
                  // ignore: unused_local_variable
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: "test3@test.com", password: "123456");
                          Navigator.pushNamedAndRemoveUntil(context, "allProducts", (route) => false);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    // ignore: avoid_print
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    // ignore: avoid_print
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  // ignore: avoid_print
                  print(e);
                }
              },
              child: const Text('Register')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // ignore: unused_local_variable
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: "test2@test.com",
                          password: "123456");
                  Navigator.pushNamedAndRemoveUntil(context, "allProducts", (route) => false);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    // ignore: avoid_print
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    // ignore: avoid_print
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: const Text('Login'))
        ],
      ),
    ));
  }
}
