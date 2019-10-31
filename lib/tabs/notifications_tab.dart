import 'package:flutter/material.dart';
import 'package:picbox/common/bodies/tab_body.dart';

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: 'Notifications',
      child: Column(
        children: <Widget>[
          for (var i = 0; i < 13; i++)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: 85,
              margin: EdgeInsets.only(bottom: 15),
            ),
        ],
      ),
    );
  }
}
