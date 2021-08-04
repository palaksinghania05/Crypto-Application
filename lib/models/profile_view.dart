import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget userProfile(BuildContext context, DocumentSnapshot profile){
    return Center(
        child: Container(
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 70,),
          CircleAvatar(
     backgroundImage: AssetImage('images/userlogo.png'),
            radius: 100,
          ),
          SizedBox(height: 50),
            RichText(
                text: TextSpan(
                    text: 'Name : ',
                    style: TextStyle(
                        color: Colors.white, fontSize: 25),
                    children: <TextSpan>[
                      TextSpan(
                        text: profile["name"],
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 25),
                      ),
                    ])),
          SizedBox(height: 30),
          RichText(
              text: TextSpan(
                  text: 'Email : ',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25),
                  children: <TextSpan>[
                    TextSpan(
                      text: profile["email"],
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 25),
                    ),
                  ])),
        ],
      ),
    )
    );
  }
}