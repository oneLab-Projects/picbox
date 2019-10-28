import 'package:flutter/material.dart';
import 'package:picbox/common/bodies/tab_body.dart';

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: 'Notifications',
      child: Center(child: Text("Notifications")),
    );
  }
}
