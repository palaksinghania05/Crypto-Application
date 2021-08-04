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
      "image": "images/logo.png"
    },
    {
      "text":"We help people invest in \ntrending crypto-currencies",
      "image": "images/investing.jpg"
    },
    {
      "text":"We show the easy way to gain profit. \nJust keep investing",
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
        SizedBox(height: 50,),
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
        RichText(
            text: TextSpan(
                text: 'Cryptic',
                style: TextStyle(
                    color: Colors.white, fontSize: 35),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Winfo',
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 35),
                  ),
                ])),
        Text(text, textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
        Spacer(flex: 2),
        CircleAvatar(
          backgroundColor: Colors.blueGrey,
          backgroundImage: AssetImage(image),
          radius: 130,
        ),
      ],
    );
  }
}
