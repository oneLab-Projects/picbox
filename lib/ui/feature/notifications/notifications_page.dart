import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';

/// Вкладка `Уведомления`.
class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      showBackButton: false,
      title: AppLocalizations.of(context).tr('notifications.title'),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: _buildNotifications(context),
      ),
    );
  }

  /// Заполняет карточками уведомлений.
  Widget _buildNotifications(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < 13; i++)
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            height: 85,
            margin: EdgeInsets.only(top: i == 0 ? 0 : 18),
          ),
      ],
    );
  }
}
