import 'package:flutter/material.dart';

class TabBody extends StatelessWidget {
  final String title;
  final Widget child;
  TabBody({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.grey[900],
          elevation: 5,
          child: SizedBox(
            height: 25,
            width: double.infinity,
          ),
        ),
        titleBar(context),
        Expanded(child: child),
        Container(
          height: 50,
          color: Colors.grey[900],
        ),
      ],
    );
  }

  titleBar(context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );
  }
}
