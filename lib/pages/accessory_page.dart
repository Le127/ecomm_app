import 'package:flutter/material.dart';

class AccessoryPage extends StatelessWidget {
  const AccessoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        title: const Text(
          "Accessory Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.shade300.withOpacity(0.9),
      ),
      body: const Center(
        child: Text('AccessoryPage'),
      ),
    );
  }
}
