import 'package:flutter/material.dart';

class TechPage extends StatelessWidget {
  const TechPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        title: const Text(
          "Tech Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.deepPurple.shade300.withOpacity(0.9),
      ),
      body: const Center(
        child: Text('TechPage'),
      ),
    );
  }
}
