import 'package:crypto_app_basic/app_widgets/sign_In.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: 70,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/cryptowallet.png'),
        radius: 70,
      ),
    );
  }
}

/*class SignUpButton extends StatelessWidget {
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
            signUp;
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }*/

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
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
                        SizedBox(height: 25),
                        ImageAsset(),
                        //SizedBox(height: 15),
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
                        child: Form(
                            key: _formKey,
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
                        Container(
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
                                signUp;
                              },
                            ),
                            width: 150,
                            height: 50)
                      ],
                    )))])))));
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
            validator: (input) {
              if (input.isEmpty) {
                return 'Enter an Email Address';
              } else if (!input.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
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
              validator: (input) {
                if (input.isEmpty) {
                  return 'Enter Name';
                }
                return null;
              },
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
              ),
   // onSaved: (input) => _name = input,
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
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Password';
              } else if (value.length < 6) {
                return 'Password must be atleast 6 characters!';
              }
              return null;
            },
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
