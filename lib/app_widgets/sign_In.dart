import 'package:crypto_app_basic/app_widgets/explorer.dart';
import 'package:crypto_app_basic/app_widgets/signUp.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/cryptowallet.png'),
        radius: 100,
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        // ignore: deprecated_member_use
        child: RaisedButton(
          child: Text(
            "SIGN IN",
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
            signIn(context);
          },
        ),
        width: 100,
        height: 50);
  }

  void signIn(BuildContext context) {
    var alertDialog = AlertDialog(
      elevation: 50,
      title: Center(
          child: Text(
        "Login Successfull !!",
        style: TextStyle(fontSize: 25),
      )),
      content: Text(
        "Click here \nto go to Home Page",
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
        textAlign: TextAlign.center,
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Explorer()),
              );
            },
            child: Text("Go to Home Page",
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

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: Column(children: <Widget>[
                      SizedBox(height: 25),
                      ImageAsset(),
                      SizedBox(height: 15),
                      RichText(
                          text: TextSpan(
                              text: 'MyCrypt',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              children: <TextSpan>[
                            TextSpan(
                              text: 'Wallet',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                            ),
                          ])),
                      SizedBox(height: 20.0),
                      UsernameEntry(),
                      SizedBox(height: 10.0),
                      PasswordEntry(),
                      ForgetPassword(),
                      SignInButton(),
                      SizedBox(height: 15),
                      Text(
                          "-------------------------- or -----------------------------",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400)),
                      SocialPages(),
                      CreateAccount()
                    ])))));
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
          child: TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                  suffixIcon: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                  ),
                  hintText: 'Your username',
                  hintStyle: TextStyle(color: Colors.grey))
          ),
        ),
      ],
    );
  }
}

class PasswordEntry extends StatelessWidget {
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
                hintText: 'Enter your Password',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        //padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class SocialPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GoogleSignInButton(
            onPressed: () => print('Google Sign In Button Pressed'),
            darkMode: true,
            text: "Continue with Google",
            splashColor: Colors.black,
          ),
          SizedBox(height: 5),
          FacebookSignInButton(
            onPressed: () => print('Facebook Sign In Button Pressed'),
            splashColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => {
        print('Sign Up Button Pressed'),
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
      SignUp(),
      ))
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
