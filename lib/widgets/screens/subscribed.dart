import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app_basic/widgets/extras/database.dart';
import 'package:crypto_app_basic/widgets/extras/explorer.dart';
import 'package:flutter/material.dart';

final usersRef = Firestore.instance.collection("users");

class SubscribedCurrencies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubscribedCurrenciesState();
  }
}

class _SubscribedCurrenciesState extends State<SubscribedCurrencies> {
  List currencyList = [];
  String imageUri = "";
  var resultStream;

  /*_getImage() async {
    await image(cryptodata.symbol).then((String result) {
      setState(() {
        imageUri = result;
        print(imageUri);
      });
    });
  }*/

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    // _getImage();
  }

  fetchDatabaseList() async {
   // List result = await DatabaseManager().getSubscribedCurrencyList();
    var stream = await DatabaseManager().getUsersCurrency(context);
    if (stream == null)
      print("Unable to retrieve!!");
    else {
     // currencyList = result;
      resultStream = stream;
      print("List fetched Succesfully!!");
      print(resultStream);
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
                stream: resultStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: Text("Loading!!"));
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) =>
                          currencyCard(
                              context, snapshot.data.documents[index]));
                })));
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
                Text("Price: ${currency["price"]}USD", style: TextStyle(fontSize: 18, color:Colors.amber, fontWeight: FontWeight.w600)),
                SizedBox(width: 150),
                Text(
                  "Rank: ${currency["rank"]}",
                  style: TextStyle(fontSize: 18, color:Colors.tealAccent, fontWeight: FontWeight.w600),
                ),
              ])),
        ]),
      ),
    );
  }
}
