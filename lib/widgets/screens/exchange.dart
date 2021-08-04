import 'package:crypto_app_basic/widgets/apis/image_request.dart';
import 'package:crypto_app_basic/widgets/extras/database.dart';
import 'package:crypto_app_basic/widgets/screens/market.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../apis/currency_request.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Exchange extends StatefulWidget {
  var cryptodata;

  Exchange(CustomCurrency cryptodata) {
    this.cryptodata = cryptodata;
  }

  @override
  State<StatefulWidget> createState() {
    return _ExchangeState(cryptodata);
  }
}

class _ExchangeState extends State<Exchange> {
  String imageUri = "";

  _getImage() async {
    await image(symbol).then((String result) {
      setState(() {
        imageUri = result;
        print(imageUri);
      });
    });
  }

  var cryptoData;
  var name;
  var price;
  var symbol;
  var supply;
  var maxSupply;

  _ExchangeState(CustomCurrency cryptoData) {
    this.cryptoData = cryptoData;
    this.name = cryptoData.name;
    this.price = double.parse(cryptoData.marketPrice).toStringAsFixed(3);
    this.symbol = cryptoData.symbol;
    this.supply = double.parse(cryptoData.availableSupply).toStringAsFixed(3);
    // this.maxSupply = double.parse(cryptoData.maxSupply).toStringAsFixed(1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(name, style: TextStyle(color: Colors.white)),
        ),
        body: Center(
            child: Container(
                alignment: Alignment.topLeft,
                color: Colors.black,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            imageUri.isNotEmpty ? NetworkImage(imageUri) : null,
                        radius: 120,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Name -   $name",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Price in USD -   \$$price",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Available Supply -   $supply",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Max. Supply Issued -   $maxSupply",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(height: 50),
                      Row(children: [
                        SizedBox(width: 60),
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white70,
                          elevation: 10,
                          child: Text("Subscribe",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          onPressed: () async {
                            Fluttertoast.showToast(
                                msg: "$name Subscribed!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.amber,
                                textColor: Colors.black,
                                fontSize: 25);
                            var uid =
                                (await FirebaseAuth.instance.currentUser()).uid;
                            DatabaseManager().addCurrencies(
                                name, price, cryptoData.rank, uid);
                          },
                        ),
                        SizedBox(width: 70),
                        RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white70,
                          elevation: 10,
                          child: Text("Unsubscribe",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          onPressed: () async {
                            Fluttertoast.showToast(
                                msg: "$name Unsubscribed!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.amber,
                                textColor: Colors.black,
                                fontSize: 25);
                            var uid =
                                (await FirebaseAuth.instance.currentUser()).uid;
                            print(uid);
                            DatabaseManager()
                                .deleteCurrencies(cryptoData.rank, uid);
                            // print(subscribed);,
                          },
                        )
                      ]),
                    ]))));
  }
}

void alreadySubscribed(BuildContext context) {
  var alertDialog = AlertDialog(
    elevation: 50,
    title: Center(
        child: Text(
      "Uh Oh! Currency already Subscribed.",
      style: TextStyle(fontSize: 25),
    )),
    actions: [
      FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Market()),
          );
        },
        child: Text("Back",
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      )
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

void subscribed(BuildContext context, var name) {
  var alertDialog = AlertDialog(
    elevation: 50,
    title: Center(
        child: Text(
      "$name Subscribed!",
      style: TextStyle(fontSize: 25),
    )),
    actions: [
      FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Market()),
            );
          },
          child: Text("Back",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
