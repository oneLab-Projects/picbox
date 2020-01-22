import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';

/// Вкладка `Для Вас`.
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      showBackButton: false,
      title: AppLocalizations.of(context).tr('home.title'),
      body: _buildCardGrid(context),
    );
  }

  /// Заполняет контент-картами.
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
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
          ),
      ],
    );
  }
}
