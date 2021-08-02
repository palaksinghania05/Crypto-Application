import 'package:crypto_app_basic/widgets/apis/currencyconvert_request.dart';
import 'package:crypto_app_basic/widgets/extras/explorer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../apis/currency_request.dart';
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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black87,
            title: Text("Explore Market"),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    //  icon: Icon(Icons.more_vert),
                    icon: Icon(Icons.home_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Explorer()),
                      );
                    }),
              )
            ]),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22)),
                            subtitle: Row(
                              children: [
                                _getPrice(cryptoData.marketPrice),
                                SizedBox(width: 70),
                                _getSubtitle(cryptoData.change),
                              ],
                            ),
                            trailing: Text(cryptoData.symbol,
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 18)),
                            onTap: () {
                              //open a specific currency page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Exchange(cryptoData)),
                              );
                            },
                          );
                        });
                  }
                })));
  }

  Widget _getSubtitle(String change) {
    String roundChange = double.parse(change).toStringAsFixed(3);
    String percentChange = "$roundChange%";
    TextSpan percentageChange;
    if (double.parse(change) > 0) {
      percentageChange = TextSpan(
          text: "+$percentChange",
          style: TextStyle(color: Colors.green, fontSize: 15));
    } else
      percentageChange = TextSpan(
          text: percentChange,
          style: TextStyle(color: Colors.red, fontSize: 15));
    return RichText(text: TextSpan(children: [percentageChange]));
  }

  Widget _getPrice(String price) {
    return FutureBuilder(
        future: convertedCurrency(),
        builder: (context, snapshot2) {
          if (snapshot2.data != null) {
            var result =
                (double.parse(price) * snapshot2.data).toStringAsFixed(3);
            return Text("INR $result",
                style: TextStyle(color: Colors.amber, fontSize: 18));
          } else {
            var alternate = (double.parse(price) * 74.42).toStringAsFixed(4);
            return Text("INR $alternate",
                style: TextStyle(color: Colors.amber, fontSize: 18));
          }
        });
  }
}
