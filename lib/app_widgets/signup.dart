
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image(
        image: AssetImage('images/signup.png'),
        width: 150,
        height: 150,
        alignment: Alignment.topCenter);
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
        style: TextStyle(fontSize: 25),
      ),
      content: Text(
        "Start investing and trading today!!",
        style: TextStyle(fontSize: 20),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}

class SignUp extends StatelessWidget {
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
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.zero,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                          borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      labelText: 'User Name',
                      labelStyle: TextStyle(
                        color: Colors.white
                      ),
                      hintText: 'Enter Your Name',
                      hintStyle: TextStyle(
                        color: Colors.white

                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  child: TextField(
                    //obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey
                      ),
                      hintText: 'Enter Password',
                        hintStyle: TextStyle(
                            color: Colors.white
                        )
                    ),
                    autofocus: true,
                  ),
                ),
                SizedBox(height: 15),
                Text("Forget Password?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                )),
                SizedBox(height: 10),
                Text("Reset Password",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15
                    )),
                SizedBox(height: 15),
                SignUpButton(),
                SizedBox(height: 15),
                Text("_______________________________________________",
                style: TextStyle(
                  color: Colors.white
                ),)
              ],
            )
        )))
    );
  }
}