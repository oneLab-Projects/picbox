import 'package:flutter/material.dart';
import 'package:picbox/src/common/bodies/tab.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: 'Profile',
      child: Center(child: Text('Profile')),
    );
  }
}
