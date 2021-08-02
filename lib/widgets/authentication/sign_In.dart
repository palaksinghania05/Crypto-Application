import 'package:crypto_app_basic/widgets/extras/explorer.dart';
import 'package:crypto_app_basic/widgets/authentication/signUp.dart';
import 'package:crypto_app_basic/widgets/extras/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: 110,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/cryptologo.png'),
        radius: 110,
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => new _SignInState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool loading = false;

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loading
        ? Loading()
        : Scaffold(
            //   resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Center(
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.black,
                        child: Form(
                            key: _formkey,
                            child: Column(children: <Widget>[
                              SizedBox(height: 50),
                              ImageAsset(),
                              SizedBox(height: 15),
                              RichText(
                                  text: TextSpan(
                                      text: 'MyCrypt',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                      children: <TextSpan>[
                                    TextSpan(
                                      text: 'Wallet',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 18),
                                    ),
                                  ])),
                              SizedBox(height: 20.0),
                              // EmailEntry(_email),
                              Column(
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
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'RobotoCondensed',
                                      ),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 14.0, bottom: 14.0),
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.white,
                                          ),
                                          hintText: 'Enter your Email',
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                      controller: _emailController,
                                      validator: emailValidator,
                                      // onSaved: (input) => _email = input,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              // PasswordEntry(_password),
                              Column(
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
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: TextFormField(
                                      obscureText: true,
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'RobotoCondensed',
                                      ),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 14.0, bottom: 14.0),
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          ),
                                          hintText: 'Enter your Password',
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                      validator: (input) {
                                        if (input.length < 8) {
                                          return 'Password needs to be at least 8 characters';
                                        }
                                      },
                                      //   onSaved: (input) => _password = input,
                                      controller: _passwordController,
                                    ),
                                  ),
                                ],
                              ),
                              ForgetPassword(),
                              // SignInButton(_formkey, _email, _password),
                              Container(
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
                                      //action
                                      onPressed: () async {
                                        try {
                                          FirebaseUser user = (await FirebaseAuth
                                                  .instance
                                                  .signInWithEmailAndPassword(
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text))
                                              .user;
                                          if (user != null) {
                                            setState(() {
                                              loading = true;
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Explorer(),
                                                ));
                                          }
                                        } catch (e) {
                                          print(e);
                                          _emailController.text = "";
                                          _passwordController.text = "";
                                          //TODO: alert
                                        }
                                      }),
                                  width: 100,
                                  height: 50),
                              SizedBox(height: 15),
                              Text(
                                  "-------------------------- or -----------------------------",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400)),
                              SocialPages(),
                              CreateAccount(),
                              SizedBox(height: 15),
                            ]))))));
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
          SizedBox(height: 8),
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
            MaterialPageRoute(
              builder: (context) => SignUp(),
            ))
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
