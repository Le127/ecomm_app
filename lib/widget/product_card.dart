import 'package:ecomm_app/helpers/mp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';

class ProductCard extends StatefulWidget {
  final List<String> link;
  final String detailName;
  final double price;
  final bool? dropDown;
  final List<String>? dropDownValues;
  final String? detail;

  const ProductCard({
    Key? key,
    required this.link,
    required this.detailName,
    required this.price,
    this.dropDown,
    this.dropDownValues,
    this.detail,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // ignore: unused_field
  String _platformVersion = 'Unknown';
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
    initPlatformState();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await MercadoPagoMobileCheckout.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 2.5),
      width: 400,
      height: 600, 
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.network(urlImage, width: 200, height: 200),

            const SizedBox(height: 10),
            thumbnailImage(),

            const SizedBox(height: 10),
            productName(),

            const SizedBox(height: 10),
            productPrice(),

            const SizedBox(height: 10),
            ratingStars(),

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

            paymentButton(),
          ],
        ),
      ),
    );
  }

  //product thumbnail images
  Flexible thumbnailImage() {
    return Flexible(
      flex: 2,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...widget.link.map((e) => GestureDetector(
          child: Image.network(e, width: 50, height: 50),
          onTap: () => setState(() {
                urlImage = e;
              })))
    ]));
  }

  //product name
   productName() {
    return Text(widget.detailName, textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400));
  }

  //product price
  Flexible productPrice() {
    return Flexible(
        child: Text("\$ ${widget.price}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
  }

  //rating stars
  Flexible ratingStars() {
    return Flexible(
        child: RatingStars(
            value: value,
            valueLabelVisibility: false,
            onValueChanged: (v) {
              setState(() => value = v);
            }));
  }

  //payment button
  ElevatedButton paymentButton() {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(300, 20))),
        onPressed: () => runMercadoPago(widget.detailName, widget.price),
        child:
            const Text("Pay", style: TextStyle(fontWeight: FontWeight.bold)));
  }
}
