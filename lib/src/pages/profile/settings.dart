import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/localization.dart';
import 'package:picbox/src/common/widgets.dart';
import 'package:picbox/src/pages/settings/language.dart';

/// Страница `Настройки`
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var supportedLanguages = Localization.supportedLanguages;
    return UScaffold(
      title: AppLocalizations.of(context).tr('settings.title'),
      body: Column(
        children: <Widget>[
          _buildLanguagePageViewButton(context, supportedLanguages),
        ],
      ),
    );
  }

  Widget _buildLanguagePageViewButton(
    BuildContext context,
    Map<String, String> supportedLanguages,
  ) =>
      UListSelect(
        AppLocalizations.of(context).tr('settings.language.title'),
        onPressed: () => Navigator.push(
            context, UPageRoute(builder: (context) => LanguagePage())),
        value: supportedLanguages[
            AppLocalizations.of(context).locale.languageCode],
        iconData: MdiIcons.earth,
      );
}
