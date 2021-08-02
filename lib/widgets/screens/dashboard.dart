import 'package:crypto_app_basic/widgets/apis/currency_request.dart';
import 'package:crypto_app_basic/widgets/screens/FAQ.dart';
import 'package:crypto_app_basic/widgets/screens/market.dart';
import 'package:crypto_app_basic/widgets/screens/subscribed.dart';
import 'package:flutter/material.dart';

/*class BitcoinImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/bitcoin.png'),
        radius: 30,
      ),
    );
  }
}*/

/*class DashImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/dash.png'),
        radius: 30,
      ),
    );
  }
}*/

/*class EthereumImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/ethereum.png'),
        radius: 100,
      ),
    );
  }
}*/

class Home extends StatelessWidget {
  /*String number_of_wallets = "0";
  Home(String number){
    this.number_of_wallets = number;
}*/
  List<CustomCurrency> subscribed = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: Container(
              alignment: Alignment.topLeft,
              color: Colors.black,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(children: [
                      SizedBox(width: 5),
                      Text(
                        'Overview',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.more_vert,
                          size: 26.0,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                    SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 10,
                                blurRadius: 5),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                SizedBox(width: 20),
                                Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.purpleAccent, fontSize: 40),
                                  textDirection: TextDirection.ltr,
                                ),
                              ]),
                              SizedBox(height: 7),
                              Row(children: [
                                SizedBox(width: 20),
                                Text("Wallets",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ]),
                              Row(children: [
                                SizedBox(width: 270),
                                TextButton(
                                    onPressed: () =>
                                        print("More Details Pressed"),
                                    child: Text("More Details",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15)))
                              ])
                            ])),
                    SizedBox(height: 15),
                   /* Row(children: [
                      SizedBox(width: 5),
                      Text(
                        'My Wallets',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.more_vert,
                          size: 26.0,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 10,
                                  blurRadius: 5),
                            ],
                          ),
                          height: 120,
                          width: 170,
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(width: 50),
                                Text("BTC",
                                    style: TextStyle(
                                        color: Colors.purple, fontSize: 15)),
                                SizedBox(width: 10),
                                BitcoinImage()
                              ],
                            ),
                            SizedBox(height: 30),
                            Text("Bitcoin",
                                style: TextStyle(
                                    color: Colors.orangeAccent, fontSize: 25)),
                          ]),
                        ),
                        SizedBox(width: 40),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 10,
                                  blurRadius: 5),
                            ],
                          ),
                          height: 120,
                          width: 170,
                          child: Column(children: [
                            Row(
                              children: [
                                SizedBox(width: 50),
                                Text("DASH",
                                    style: TextStyle(
                                        color: Colors.purple, fontSize: 15)),
                                SizedBox(width: 10),
                                DashImage()
                              ],
                            ),
                            SizedBox(height: 30),
                            Text("Dash",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 25)),
                          ]),
                        )
                      ],
                    ),*/
                    Spacer(flex: 2),
                    Row(children: [
                      SizedBox(width: 60),
                      Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            child: Text(
                              "View all Cryptocurrency",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Roboto Condensed",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            color: Colors.blueGrey,
                            elevation: 100.0,
                            onPressed: () {
                              //action
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Market()),
                              );
                            },
                          ),
                          width: 260,
                          height: 40),
                    ]),
                    SizedBox(height: 20,),
                    Row(children: [
                      SizedBox(width: 60),
                      Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            child: Text(
                              "Subscribed Currencies",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Roboto Condensed",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            color: Colors.blueGrey,
                            elevation: 100.0,
                            onPressed: () {
                              //action
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubscribedCurrencies()),
                              );
                            },
                          ),
                          width: 260,
                          height: 40),
                    ]),
                    Spacer(flex: 1)
                  ]))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.support_agent_sharp,
          size: 40,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQ()),
          );
        },
      ),
    );
  }
}
