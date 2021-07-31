import 'package:crypto_app_basic/widgets/authentication/sign_In.dart';
import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: 110,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/cryptowallet.png'),
        radius: 110,
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Roboto Condensed",
              fontWeight: FontWeight.w700,
            ),
          ),
          color: Colors.grey,
          elevation: 100.0,
          onPressed: () {
            //action
            signUp(context);
          },
        ),
        width: 150,
        height: 50);
  }

  void signUp(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text(
        "Registration Completed Successfully",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      content: Text(
        "Start investing and trading today!!",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
            child: Text("Login Now",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Container(
                alignment: Alignment.center,
                color: Colors.black,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        ImageAsset(),
                        SizedBox(height: 15),
                        Text(
                          "Create a new account",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "Roboto Condensed",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 10),
                    Container(
                            child: Column(
                              children: <Widget>[
                        EmailEntry(),
                        SizedBox(height: 10),
                        UsernameEntry(),
                        SizedBox(height: 10),
                        NewPasswordEntry(),
                        SizedBox(height: 10),
                        ConfirmPasswordEntry(),
                        SizedBox(height: 10),
                        SignUpButton()
                      ],
                    ))])))));
  }
}

class EmailEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          width: 310.0,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}

class UsernameEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          width: 310.0,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                  suffixIcon: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: 'Your username',
                  hintStyle: TextStyle(color: Colors.grey))),
        ),
      ],
    );
  }
}

class NewPasswordEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          width: 310.0,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: TextFormField(
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,

            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter New Password',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}

class ConfirmPasswordEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          width: 310.0,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: TextField(
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter Password Again',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
