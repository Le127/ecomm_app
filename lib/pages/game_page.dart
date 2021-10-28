import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         iconTheme:const IconThemeData(color: Colors.black),
        title: const Text(
          "Game Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.shade300.withOpacity(0.9),
      ),
      body: const Center(
        child: Text('GamePage'),
      ),
    );
  }
}
