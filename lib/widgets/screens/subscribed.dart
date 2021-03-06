import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app_basic/models/currency_card.dart';
import 'package:crypto_app_basic/widgets/extras/database.dart';
import 'package:crypto_app_basic/widgets/extras/explorer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final usersRef = Firestore.instance.collection("users");

class SubscribedCurrencies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubscribedCurrenciesState();
  }
}

class _SubscribedCurrenciesState extends State<SubscribedCurrencies> {

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    var stream = await DatabaseManager().getUsersCurrency(context);
    if (stream == null)
      print("Unable to retrieve!!");
    else {
      print("List fetched Succesfully!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text("My Subscribed Currencies"),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
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
            child: StreamBuilder(
                stream: DatabaseManager().getUsersCurrency(context),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: SpinKitPouringHourglass(
                      color: Colors.lightGreen,
                      size: 60,
                    ));
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) =>
                          CurrencyCard().currencyCard(
                              context, snapshot.data.documents[index]));
                })));
  }
}
