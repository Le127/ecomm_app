import 'package:flutter/material.dart';
import 'package:ecomm_app/widget/product_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UniqueProductPage extends StatelessWidget {
  final List<String> urlImage;
  final String? detailName;
  final double? price;
  final List<String>? dropDownValues;
  final bool? dropDown;
  final String? detail;

  const UniqueProductPage(
      {Key? key,
      required this.urlImage,
      this.detailName,
      this.price,
      this.dropDownValues,
      this.detail,
      this.dropDown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.transparent,
        disabledElevation: 0,
        hoverElevation: 0,
        elevation: 0,
        hoverColor: Colors.grey[200],
        child: const FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Flex(direction: Axis.vertical, children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(30),
              child: ProductCard(
                link: urlImage,
                detailName: detail!,
                price: price!,
                dropDown: dropDown,
                dropDownValues: dropDownValues,
                detail: detail,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
