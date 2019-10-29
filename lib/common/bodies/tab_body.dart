import 'package:flutter/material.dart';

class TabBody extends StatelessWidget {
  final String title;
  final Widget child;
  TabBody({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (title != null) titleBar(context),
                  child,
                ],
              ),
            ),
          ),
          Container(
            height: 50 + MediaQuery.of(context).viewInsets.bottom,
            color: Colors.grey[900],
          ),
        ],
      ),
    );
  }

  titleBar(context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 26),
          ),
        ],
      ),
    );
  }
}
