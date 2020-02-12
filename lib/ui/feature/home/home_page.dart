import 'dart:math';
import 'dart:ui';

import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';
import 'package:picbox/util/random_color.dart';

/// Вкладка `Для Вас`.
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var content = _buildCardGrid(context);
    return UScaffold(
      showBackButton: false,
      title: AppLocalizations.of(context).tr('home.title'),
      body: content,
      backgroundBody: _buildBackground(context, content),
    );
  }

  Stack _buildBackground(BuildContext context, Widget content) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: UScaffold.titleHeight + MediaQuery.of(context).padding.top,
          ),
          child: content,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            height: MediaQuery.of(context).size.height * 100,
            padding: EdgeInsets.only(
                top: UScaffold.titleHeight + MediaQuery.of(context).padding.top,
                bottom: UScaffold.titleHeight),
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
          ),
        ),
      ],
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
            color: ColorTool.getBrightColor(),
            urlImage:
                "https://loremflickr.com/300/300?random=${Random().nextInt(100)}",
          ),
      ],
    );
  }
}
