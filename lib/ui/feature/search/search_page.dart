import 'dart:math';

import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:picbox/ui/widget/pansy.dart';
import 'package:picbox/util/random_color.dart';

/// Вкладка `Поиск`.
class SearchTab extends StatelessWidget {
  static const double _cardSize = 150;

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      showBackButton: false,
      body: Column(
        children: <Widget>[
          _buildSearchBar(context),
          UListContent(
            AppLocalizations.of(context).tr('search.popular_topics'),
            iconData: MdiIcons.starFourPoints,
            variant: true,
            child: _buildPopularContent(context),
          ),
        ],
      ),
    );
  }

  /// Создаёт поле ввода для поиска.
  Widget _buildSearchBar(context) {
    return Padding(
      padding: const EdgeInsets.all(15).copyWith(bottom: 10),
      child: TextField(
        autocorrect: false,
        decoration: RoundInputDesign(
          context,
          hintText: AppLocalizations.of(context).tr('search.title'),
        ),
      ),
    );
  }

  /// Создаёт список популярных тем.
  Widget _buildPopularContent(context) {
    return Container(
      height: _cardSize,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: <Widget>[
          for (int i = 0; i < 13; i++)
            Padding(
              padding: EdgeInsets.only(left: i == 0 ? 0 : 10),
              child: ContentCard(
                title: "Карточка $i",
                width: _cardSize,
                description: "#тест #${10000 + Random().nextInt(89999)} #хех",
                color: ColorTool.getBrightColor(),
                variant: ContentCardVariant.mini,
                /*urlImage:
                  "https://loremflickr.com/300/300?random=${Random().nextInt(100)}",*/
              ),
            ),
        ],
      ),
    );
  }
}
