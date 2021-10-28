import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ProductCard extends StatefulWidget {
  final List<String> link;

  const ProductCard({Key? key, required this.link}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late String urlImage;
  double value = 3.5;
  String dropdownValue = "S";

  @override
  void initState() {
    urlImage = widget.link[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: 350,
      height: 550,
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Image.network(urlImage, width: 250, height: 250),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...widget.link.map(
                  (e) => GestureDetector(
                      child: Image.network(e, width: 50, height: 50),
                      onTap: () => setState(() {
                            urlImage = e;
                          })),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text("Remera Top full",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            const Text("\$201.99",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            RatingStars(
                value: value,
                valueLabelVisibility: false,
                onValueChanged: (v) {
                  setState(() => value = v);
                }),
            const SizedBox(height: 10),
            DropdownButton(
              items: <String>['S', 'M', 'L', 'XL'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(300, 20)),
                ),
                onPressed: () {},
                child: const Text("Pay",
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
