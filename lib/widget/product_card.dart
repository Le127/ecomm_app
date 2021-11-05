import 'package:flutter/material.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductCard extends StatefulWidget {
  final List<String> link;
  final String detailName;
  final double price;
  final bool? dropDown;
  final List<String>? dropDownValues;
  final String? detail;

  const ProductCard(
      {Key? key,
      required this.link,
      required this.detailName,
      required this.price,
      this.dropDown,
      this.dropDownValues,
      this.detail})
      : super(key: key);

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
            const SizedBox(height: 10),
            Image.network(urlImage, width: 250, height: 250),
            const SizedBox(height: 10),
            Flexible(
              child: Row(
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
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Text(widget.detailName,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Text("\$ ${widget.price}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: RatingStars(
                  value: value,
                  valueLabelVisibility: false,
                  onValueChanged: (v) {
                    setState(() => value = v);
                  }),
            ),
            const Flexible(child: SizedBox(height: 10)),

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
                : Expanded(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(child: Text(widget.detail!)),
                    )),
                  ),
            const Expanded(child: SizedBox(height: 10)),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(300, 20)),
              ),
              onPressed: () => runMercadoPago(widget.detailName, widget.price),
              child: const Text("Pay",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> runMercadoPago(detailName, price) async {
  createPreferences(detailName, price).then((res) async {
    var sandBoxInitPoint = res["response"]["sandbox_init_point"];

    return launchURL(sandBoxInitPoint);
  });
}

Future<Map<String, dynamic>> createPreferences(detailName, price) async {
  var mp = MP(dotenv.env['MP_CLIENT_ID'], dotenv.env['MP_CLIENT_SECRET']);
  var preference = {
    "items": [
      {
        "title": detailName,
        "quantity": 1,
        "currency_id": "ARS",
        "unit_price": price,
      }
    ],
  };

  var result = await mp.createPreference(preference);

  return result;
}

void launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
