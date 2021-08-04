import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget currencyCard(BuildContext context, DocumentSnapshot currency) {
    return Container(
      child: Card(
        //margin: EdgeInsetsGeometry.infinity,
        color:Colors.blueGrey,
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top:10, left: 10),
              child: Row(
                children: [
                  Text(
                    currency["name"],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          SizedBox(height: 2),
          Padding(
              padding: const EdgeInsets.only(top:8, left:10, bottom: 10),
              child: Row(children: [
                Text("Price: ${currency["price"]}USD", style: TextStyle(fontSize: 18, color:Colors.lightGreen, fontWeight: FontWeight.w600)),
                SizedBox(width: 150),
                Text(
                  "Rank: ${currency["rank"]}",
                  style: TextStyle(fontSize: 18, color:Colors.redAccent, fontWeight: FontWeight.w600),
                ),
              ])),
        ]),
      ),
    );
  }
}