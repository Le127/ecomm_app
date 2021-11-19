import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({Key? key}) : super(key: key);

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  String? email;
  @override
  void initState() {
    email = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = 350;
    double heightSize = 350;

    if (size.width >= 1091 && size.height >= 624) {
      widthSize = 500;
      heightSize = 500;
    }
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        email =
            currentUser.email!.substring(0, currentUser.email!.indexOf('@'));
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            Text(email!),
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, "login", (route) => false);
              },
              child: const FaIcon(FontAwesomeIcons.signOutAlt))
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: widthSize,
          height: heightSize,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              GestureDetector(
                child: Card(
                  color: Colors.yellow.shade300.withOpacity(0.9),
                  child: const Center(
                      child: FaIcon(
                    FontAwesomeIcons.tshirt,
                    size: 65,
                    color: Colors.black,
                  )),
                ),
                onTap: () => {Navigator.pushNamed(context, "clothing")},
              ),
              GestureDetector(
                child: Card(
                  color: Colors.deepPurple.shade300.withOpacity(0.9),
                  child: const Center(
                      child: FaIcon(
                    FontAwesomeIcons.tv,
                    size: 65,
                    color: Colors.black,
                  )),
                ),
                onTap: () => {Navigator.pushNamed(context, "tech")},
              ),
              GestureDetector(
                child: Card(
                  color: Colors.red.shade300.withOpacity(0.9),
                  child: const Center(
                      child: FaIcon(
                    FontAwesomeIcons.gamepad,
                    size: 65,
                    color: Colors.black,
                  )),
                ),
                onTap: () => {Navigator.pushNamed(context, "game")},
              ),
              GestureDetector(
                child: Card(
                  color: Colors.green.shade300.withOpacity(0.9),
                  child: const Center(
                      child: FaIcon(
                    FontAwesomeIcons.solidFutbol,
                    size: 65,
                    color: Colors.black,
                  )),
                ),
                onTap: () => {Navigator.pushNamed(context, "sports")},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
