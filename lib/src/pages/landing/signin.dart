import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Login"),
          ),
          RaisedButton(
            child: Text("Sign Up"),
            onPressed: () => Navigator.pushNamed(context, '/signup'),
          ),
        ],
      ),
    ));
  }
}
