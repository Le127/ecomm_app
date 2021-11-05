import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

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
