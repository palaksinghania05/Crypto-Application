import 'package:crypto_app_basic/widgets/extras/explorer.dart';
import 'package:crypto_app_basic/widgets/authentication/signUp.dart';
import 'package:crypto_app_basic/widgets/extras/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image(
      image: AssetImage('images/logo.png'),
      height: 250,
      width: 250,
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
                              SizedBox(height: 70),
                              ImageAsset(),
                              RichText(
                                  text: TextSpan(
                                      text: 'Cryptic',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                      children: <TextSpan>[
                                    TextSpan(
                                      text: 'Winfo',
                                      style: TextStyle(
                                          color: Colors.lightGreen,
                                          fontSize: 25),
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
                              SizedBox(
                                height: 10,
                              ),
                              Text("Sign In with",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                              _buildSocialBtnRow(),
                              CreateAccount(),
                              SizedBox(height: 30),
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
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w400,
              fontSize: 18),
        ),
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

Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}

Widget _buildSocialBtnRow() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildSocialBtn(
          () => print('Login with Facebook'),
          AssetImage(
            'images/facebook-logo.png',
          ),
        ),
        _buildSocialBtn(
          () => print('Login with Google'),
          AssetImage(
            'images/google-logo.png',
          ),
        ),
      ],
    ),
  );
}
