import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:picbox/ui/global/localizations/bloc/bloc.dart';
import 'package:provider/provider.dart';

import 'localizations_settings_page.dart';

/// Страница `Настройки`.
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: 'settings.title'.tr(),
      body: Column(
        children: <Widget>[
          _buildLanguagePageViewButton(context),
        ],
      ),
    );
  }

  /// Создаёт кнопку для перехода на страницу `Язык интерфейса`
  Widget _buildLanguagePageViewButton(BuildContext context) {
    var supportedLocales =
        Provider.of<LocalizationsBloc>(context).supportedLocales;
    String localeName = supportedLocales[Localizations.localeOf(context)];

    return UListSelect(
      'settings.localizations.title'.tr(),
      iconData: MdiIcons.earth,
      value: localeName,
      onPressed: () => Navigator.push(context,
          UPageRoute(builder: (context) => LocalizationsSettingPage())),
    );
  }
}
