import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:picbox/src/common/widgets.dart';

/// Вкладка `Для Вас`
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      showBackButton: false,
      title: AppLocalizations.of(context).tr('home.title'),
      body: _buildCardGrid(context),
    );
  }

  Widget _buildCardGrid(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(15),
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
      children: <Widget>[
        for (int i = 0; i < 13; i++)
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
          ),
      ],
    );
  }
}
