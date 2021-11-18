import 'dart:io';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> runMercadoPago(detailName, price) async {
  await dotenv.load();

  String? mpTESTPublicKey = dotenv.env['MPTEST_PUBLICKEY'];

  createPreferences(detailName, price).then((res) async {
    var sandBoxInitPoint = res["response"]["sandbox_init_point"];
    var preferenceID = res["response"]["id"];
    if (Platform.isAndroid) {
      await MercadoPagoMobileCheckout.startCheckout(
          mpTESTPublicKey!, preferenceID);
      return;
    }
    return launchURL(sandBoxInitPoint);
  });
}

Future<Map<String, dynamic>> createPreferences(detailName, price) async {
  //
  //ES NECESARIO AGREGAR UN EMAIL PARA QUE INGRESE EN EL CHECKOUT
  //
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
    "payer": {
      "email": "john@yourdomain.com",
    }
  };

  var result = await mp.createPreference(preference);

  return result;
}

void launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
