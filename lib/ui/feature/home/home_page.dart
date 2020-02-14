import 'dart:math';

import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';

/// Вкладка `Для Вас`.
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var content = _buildCardGrid(context);
    return UScaffold(
      showBackButton: false,
      title: AppLocalizations.of(context).tr('home.title'),
      body: content,
      blurBackground: true,
    );
  }

  /// Заполняет контент-картами.
  Widget _buildCardGrid(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(18),
      crossAxisSpacing: 17,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 17,
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.landscape ? 4 : 2,
      children: <Widget>[
        for (int i = 0; i < 13; i++)
          ContentCard(
            title: "Карточка $i",
            description: "#тест #${10000 + Random().nextInt(89999)} #хех",
            urlImage:
                "https://loremflickr.com/300/300?random=${Random().nextInt(100)}",
          ),
      ],
    );
  }
}
