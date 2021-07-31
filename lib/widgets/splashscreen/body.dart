import 'package:crypto_app_basic/widgets/authentication/sign_In.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":"Welcome to MyCryptWallet, Let's trade!",
      "image": "images/cryptologo.png"
    },
    {
      "text":"We help people invest in trending crypto-currencies",
      "image": "images/investing.jpg"
    },
    {
      "text":"We show the easy way to gain profit. Just keep investing",
      "image": "images/profit.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
        width: double.infinity,
        child: Column(
      children: [
        Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashUpper(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"]),
            )),
        Spacer(),
        Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  splashData.length,
                      (index) => transform(index: index))
            ),
            Spacer(flex:3),
            TransferButton(
              text:"Let's get started",
              press: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ))
              }
            ),
            Spacer()
          ],
        )))
      ],
    )));
  }

  AnimatedContainer transform({int index}){
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(right:5),
      height:8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
          color: currentPage == index ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(3)
      ),
    );
  }

}

class TransferButton extends StatelessWidget {
  const TransferButton({
    Key key, this.text, this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      color: Colors.black,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,

          )
        )
    )
    );
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
        Text(text, textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey)),
        Spacer(flex: 2),
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 130,
        ),
      ],
    );
  }
}
