import 'package:flutter/material.dart';
import 'package:picbox/common/bodies/tab_body.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: "Home",
      child: Center(child: Text("Home")),
    );
  }
}
