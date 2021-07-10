import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_requests.dart';
import 'exchange.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87, title: Text("Explore Market")),
        body: Container(
          color: Colors.black,
          child: FutureBuilder(
              future: fetchAllCurrencies(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        final cryptoData = snapshot.data[i];
                        return ListTile(
                          title: Text(cryptoData.name,
                              style:
                              TextStyle(color: Colors.white, fontSize: 15)),
                          subtitle: Row(
                            children: [
                              _getPrice(cryptoData.marketPrice),
                              SizedBox(width: 80),
                              _getSubtitle(cryptoData.change)
                            ],
                          ),
                          trailing: Text(cryptoData.symbol,
                              style: TextStyle(color: Colors.purple)),
                          onTap: () {
                            //open a specific currency page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  Exchange(cryptoData)),
                            );
                          },
                        );
                      });
                }}
          )));
  }

  Widget _getSubtitle(String change) {
    String roundChange = double.parse(change).toStringAsFixed(3);
    String percentChange = "$roundChange%";
    TextSpan percentageChange;
    if (double.parse(change) > 0) {
      percentageChange =
          TextSpan(text: "+$percentChange", style: TextStyle(color: Colors.green));
    } else
      percentageChange =
          TextSpan(text: percentChange, style: TextStyle(color: Colors.red));
    return RichText(text: TextSpan(children: [percentageChange]));
  }


  Widget _getPrice(String price){
    return FutureBuilder(
        future: convertedCurrency(),
        builder: (context, snapshot2){
          if(snapshot2.data != null){
            var result = (double.parse(price) * snapshot2.data).toStringAsFixed(3);
            return Text("INR $result", style: TextStyle(color: Colors.white, fontSize: 15));
          }
          else{
            return Text("Loading..",style: TextStyle(color: Colors.white, fontSize: 15));
          }
        });

  }
}