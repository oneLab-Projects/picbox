import 'package:flutter/material.dart';
import 'package:picbox/common/bodies/tab_body.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: "Profile",
      child: Center(child: Text("Profile")),
    );
  }
}
