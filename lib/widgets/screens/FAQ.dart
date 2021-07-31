import 'package:flutter/material.dart';

class FAQ extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
        title: Text("Frequently Asked Questions", style:TextStyle(color: Colors.white))
      ),
      body: Center(
        child: Container(
        alignment: Alignment.topLeft,
        color: Colors.black,
    ))
    );
  }

}