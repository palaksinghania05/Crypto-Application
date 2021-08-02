import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> convertedCurrency() async{
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/convert",{
  "apiKey":"e061454d33893cc2234a",
      "q": "USD_INR",
      "compact": "ultra"
  });
  http.Response res = await http.get(currencyURL);
  if(res.statusCode == 200){
    var body = jsonDecode(res.body);
    return body["USD_INR"];
  }
}