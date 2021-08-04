import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app_basic/models/profile_view.dart';
import 'package:crypto_app_basic/widgets/extras/database.dart';
import 'package:crypto_app_basic/widgets/extras/explorer.dart';
import 'package:flutter/material.dart';

final usersRef = Firestore.instance.collection("users");

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  String imageUri = "";

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    var stream = await DatabaseManager().getUserData(context);
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
            title: Text("My Profile"),
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
                stream: DatabaseManager().getUserData(context),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: Text("Loading!!"));
                  return ProfileView().userProfile(
                              context, snapshot.data.documents[0]);
                })
        ));
  }
}
