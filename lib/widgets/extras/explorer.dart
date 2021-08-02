import 'package:crypto_app_basic/widgets/screens/FAQ.dart';
import 'package:crypto_app_basic/widgets/screens/dashboard.dart';
import 'package:crypto_app_basic/widgets/screens/market.dart';
import 'package:crypto_app_basic/widgets/authentication/sign_In.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Explorer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExplorerState();
  }
}

class _ExplorerState extends State<Explorer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: RichText(
                text: TextSpan(
                    text: 'MyCrypt',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'Wallet',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                  ),
                ])),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    //  icon: Icon(Icons.more_vert),
                    icon: Icon(Icons.logout),
                    onPressed: logOut),
              )
            ]),
        drawer: Drawer(
            elevation: 100,
            child: ListView(children: <Widget>[
              Container(
                  child: UserAccountsDrawerHeader(
                accountName: Text("Username"),
                accountEmail: Text("username@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    //foregroundColor: Colors.black,
                    backgroundColor: Colors.black38,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/signup.png'),
                      radius: 100,
                    )
                    /*Text("User\nPicture",
                        style: TextStyle(
                          fontSize: 15.0,
                        ))),
                decoration: BoxDecoration(color: Colors.blueGrey)),*/
                    ),
              )),
              ListTile(
                leading: Icon(Icons.dashboard_outlined),
                title: Text("Dashboard"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Explorer()),
                  );
                },
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.money),
                title: Text("Market"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Market()),
                  );
                },
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.attach_money_outlined),
                title: Text("My Wallets"),
                /* onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exchange(cryptodata)),
                  );
                },*/
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text("Alerts"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("My Profile"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.star_rate),
                title: Text("Rate Us"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.question_answer_rounded),
                title: Text("FAQs"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQ()),
                  );
                },
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ])),
        body: Home());
  }

  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      FirebaseAuth.instance.onAuthStateChanged.listen((FirebaseUser user) {
        if (user == null) {
          print("Signed Out!");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ));
        } else
          print("User is there");
      });
    } catch (e) {
      print(e.toString());
    }
    /* var alertDialog = AlertDialog(
        title: Center(child: Text('Log Out', style: TextStyle(fontSize: 20))),
        content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            child: Text(
              "Are you sure you want to sign out of your account?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    }),
                FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Explorer()));
                    })
              ])
        ]));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });*/
  }
}
