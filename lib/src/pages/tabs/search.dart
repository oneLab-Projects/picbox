import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:picbox/src/common/decorations/input.dart';
import 'package:picbox/src/common/widgets.dart';

/// Вкладка `Поиск`
class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      showBackButton: false,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            _buildSearchBar(context),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: 185,
              margin: const EdgeInsets.only(top: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(context) {
    return TextField(
      autocorrect: false,
      decoration: RoundInputDesign(
        context,
        hintText: AppLocalizations.of(context).tr('search.title'),
      ),
    );
  }
}
