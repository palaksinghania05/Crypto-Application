import 'dart:convert';
import 'package:http/http.dart' as http;


class CustomCurrency {
  final String rank;
  final String symbol;
  final String name;
  final String marketPrice;
  final String change;

  CustomCurrency(this.rank, this.symbol, this.name, this.marketPrice, this.change);
}


Future fetchAllCurrencies() async {
  var response =
  await http.get(Uri.parse("https://api.coincap.io/v2/assets"));
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<CustomCurrency> currencies = [];
    for (var element in jsonData["data"]) {
      CustomCurrency currency = CustomCurrency(
          element["rank"], element["symbol"],
          element["name"], element["priceUsd"], element["changePercent24Hr"]);
      currencies.add(currency);
    }
    print(currencies.length);
    return currencies;
  } else
    throw Exception("Failed to load currencies!!");
}

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

