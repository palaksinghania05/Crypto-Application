import 'dart:convert';
import 'package:http/http.dart' as http;


class CustomCurrency {
  final String rank;
  final String symbol;
  final String name;
  final String marketPrice;
  final String change;
  final String availableSupply;
  final String maxSupply;

  CustomCurrency(this.rank, this.symbol, this.name, this.marketPrice, this.change, this.availableSupply,
      this.maxSupply);
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
          element["name"], element["priceUsd"], element["changePercent24Hr"], element["supply"], element["maxSupply"]);
      currencies.add(currency);
    }
    print(currencies.length);
    return currencies;
  } else
    throw Exception("Failed to load currencies!!");
}


