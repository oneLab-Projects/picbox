import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pansy_ui/pansy_ui.dart';

/// Страница `Настройки`.
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

  /// Создаёт кнопку для перехода на страницу `Язык интерфейса`
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
