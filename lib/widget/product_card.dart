import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ProductCard extends StatefulWidget {
  final List<String> link;
  final String detail;
  final double price;
  final bool? dropDown;
  final List<String>? dropDownValues;

  const ProductCard({
    Key? key,
    required this.link,
    required this.detail,
    required this.price,
    this.dropDown,
    this.dropDownValues,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late String urlImage;
  late String? dropdownValue;
  double value = 3.5;

  @override
  void initState() {
    urlImage = widget.link[0];
    if (widget.dropDown == true && widget.dropDownValues!.isNotEmpty) {
      dropdownValue = widget.dropDownValues![0];
    } else {
      dropdownValue = "";
    }
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
            Text(widget.detail,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
            const SizedBox(height: 10),
            Text("\$ ${widget.price}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            RatingStars(
                value: value,
                valueLabelVisibility: false,
                onValueChanged: (v) {
                  setState(() => value = v);
                }),
            const SizedBox(height: 10),

            //dropDown?
            widget.dropDown == true
                ? DropdownButton(
                    items:
                        <String>[...widget.dropDownValues!].map((String value) {
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
                  )
                : const SizedBox(height: 40),
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
