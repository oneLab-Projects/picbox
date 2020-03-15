import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:pansy_ui/pansy_ui.dart';

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
            'search.popular_topics'.tr(),
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
          hintText: 'search.title'.tr(),
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
