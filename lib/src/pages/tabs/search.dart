import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/decorations/input.dart';
import 'package:picbox/src/common/widgets.dart';

/// Вкладка `Поиск`
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

  Widget _buildPopularContent(context) {
    return Container(
      height: _cardSize,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          for (var i = 0; i < 5; i++)
            Container(
              width: _cardSize,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
        ],
      ),
    );
  }
}
