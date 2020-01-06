import 'package:flutter/material.dart';

/// Страница `Регистрация`
class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text("Register"),
          ),
        ],
      ),
    ));
  }
}
