import 'package:crypto_app_basic/app_widgets/market.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_converter/Currency.dart';

import 'api_requests.dart';

// ignore: must_be_immutable
class Exchange extends StatelessWidget{
  var cryptoData;
  var name;
  var price;

  List<CustomCurrency> _subscribedList = [];

  Exchange(CustomCurrency cryptoData){
    this.cryptoData = cryptoData;
    this.name = cryptoData.name;
    this.price = double.parse(cryptoData.marketPrice).toStringAsFixed(3);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black87,
       title: Text(
           name, style:TextStyle(color: Colors.white)
       ),
     ),
     body: Center(
         child: Container(
             alignment: Alignment.topLeft,
             color: Colors.black,
             child:Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 20,),
                   Text("Name - $name", style:TextStyle(color: Colors.white, fontSize: 15)),
             Text("Price in USD - \$$price", style:TextStyle(color: Colors.white, fontSize: 15)),
                 Row(
           children:[SizedBox(width: 60),
           RaisedButton(
         color: Colors.green,
         textColor: Colors.white70,
         elevation: 10,
         child: Text("Subscribe"),
         onPressed: (){
           print("$name Subscribed!!");
           if(_subscribedList.contains(cryptoData.name))
             alreadySubscribed(context);
           else {
             _subscribedList.add(cryptoData);
             subscribed(context, name);
           }
           print(_subscribedList);
         },
       ),
           SizedBox(width: 70),
           RaisedButton(
             color: Colors.red,
             textColor: Colors.white70,
             elevation: 10,
             child: Text("Unsubscribe"),
             onPressed: (){
               print("$name Unsubscribed!!");
             },
           )]),
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
              style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
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
              style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}