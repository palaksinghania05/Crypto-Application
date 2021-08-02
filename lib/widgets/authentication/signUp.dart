import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app_basic/widgets/authentication/Auth_Service.dart';
import 'package:crypto_app_basic/widgets/authentication/sign_In.dart';
import 'package:crypto_app_basic/widgets/extras/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

/*  void signUp(BuildContext context) {
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

 */

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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

  String pwdValidator(String value) {
    if (value.length < 6) {
      return 'Password must be longer than 6 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: Form(
                        key: _registerFormKey,
                        child: Column(children: <Widget>[
                          SizedBox(height: 50),
                          ImageAsset(),
                          SizedBox(height: 20),
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
                          SizedBox(height: 32),
                          Container(
                              child: Column(
                            children: <Widget>[
                              // EmailEntry(),
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
                              SizedBox(height: 10),
                              // UsernameEntry(),
                              Column(
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
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'RobotoCondensed',
                                        ),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 14.0, bottom: 14.0),
                                            suffixIcon: Icon(
                                              Icons.info,
                                              color: Colors.white,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            ),
                                            hintText: 'Your username',
                                            hintStyle:
                                                TextStyle(color: Colors.grey)),
                                        controller: _usernameController,
                                        validator: (value) {
                                          NameValidator.validate(value);
                                        }
                                        // onSaved: (input) => _username = input,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // NewPasswordEntry(),
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
                                          hintText: 'Enter New Password',
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                      controller: _passwordController,
                                      validator: pwdValidator,
                                      //onSaved: (input) => _password = input,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // ConfirmPasswordEntry(),
                              Column(
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
                                          hintText: 'Enter Password Again',
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                      //    controller: confirmPwdInputController,
                                      validator: pwdValidator,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // SignUpButton()
                              Container(
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Roboto Condensed",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      color: Colors.grey,
                                      elevation: 100.0,
                                      onPressed: () async {
                                        try {
                                          var userId = AuthService().createUserWithEmailAndPassword(
                                              _emailController.text, _passwordController.text, _usernameController.text);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignIn(),
                                                ));
                                          }catch (e) {
                                          print(e);
                                          _emailController.text = "";
                                          _passwordController.text = "";
                                          //TODO: alertdialog
                                        }
                                      })),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ))
                        ]))))));
  }
}
