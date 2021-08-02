import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<String> image(String symbol) async{
  String finalSymbol = symbol.toLowerCase();
  final Uri currencyURL = Uri.https("cryptoicons.org", "/api/icon/$finalSymbol/200");
  http.Response res = await http.get(currencyURL);
  print(res.statusCode);
  if(res.statusCode == 200){
    return "https://cryptoicons.org/api/icon/$finalSymbol/200";
  }
  else{
    return "https://cryptoicons.org/api/icon/generic/200";
  }
}