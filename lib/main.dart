import 'package:flutter/material.dart';
import 'package:crypto_app_basic/app_widgets/sign_in.dart';

void main() async {
  runApp(MyCryptWallet());
}

class MyCryptWallet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sign In",
      home: SignIn()
    );
  }
}
