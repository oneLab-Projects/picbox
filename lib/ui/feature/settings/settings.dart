import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/ui/widget/pansy.dart';
import 'package:picbox/ui/global/localizations/localizations_delegates.dart';
import 'package:picbox/ui/global/localizations/ui/localizations_setting_page.dart';

/// Страница `Настройки`
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var supportedLanguages = LocalizationsDelegates.instance.supportedLanguages;
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
  ) {
    return UListSelect(
      AppLocalizations.of(context).tr('settings.localizations.title'),
      onPressed: () => Navigator.push(context,
          UPageRoute(builder: (context) => LocalizationsSettingPage())),
      value:
          supportedLanguages[AppLocalizations.of(context).locale.languageCode],
      iconData: MdiIcons.earth,
    );
  }
}
