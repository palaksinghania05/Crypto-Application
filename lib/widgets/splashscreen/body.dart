import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
            flex: 3,
            child: PageView.builder(
              itemBuilder: (context, index) => SplashUpper(
                  image: "images/cryptowallet.png",
                  text: "Welcome to MyCryptWallet, Let's Trade!"),
            )),
        Expanded(flex: 2, child: SizedBox())
      ],
    ));
  }
}

class SplashUpper extends StatelessWidget {
  const SplashUpper({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("MyCryptWallet",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.teal)),
        Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: 170,
          width: 170,
        )
      ],
    );
  }
}
