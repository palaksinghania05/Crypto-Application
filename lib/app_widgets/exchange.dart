import 'package:crypto_app_basic/app_widgets/market.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_requests.dart';

// ignore: must_be_immutable
class Exchange extends StatelessWidget{
  var cryptoData;

  Exchange(CustomCurrency cryptoData){
    this.cryptoData = cryptoData;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var name = cryptoData.name;
    var price = double.parse(cryptoData.marketPrice).toStringAsFixed(3);

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
             
                 ],
               ),
             )
         )
          /* Row(
           children:[SizedBox(width: 60),
           RaisedButton(
         color: Colors.green,
         textColor: Colors.white70,
         elevation: 10,
         child: Text("Subscribe"),
         onPressed: (){
           print("$name Subscribed!!");
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
   ])))*/);
  }

}