import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:picbox/src/common/bodies/tab.dart';

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBody(
      title: AppLocalizations.of(context).tr('notifications.title'),
      child: Padding(
        padding: const EdgeInsets.all(15).copyWith(bottom: 5),
        child: _buildNotifications(context),
      ),
    );
  }

  Widget _buildNotifications(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < 13; i++)
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            height: 85,
            margin: const EdgeInsets.only(bottom: 15),
          ),
      ],
    );
  }
}
