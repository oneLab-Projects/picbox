import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picbox/src/common/localization.dart';
import 'package:picbox/src/common/widgets.dart';
import 'package:picbox/src/common/dialogs/select.dart';

/// Страница `Для разработчиков`
class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: AppLocalizations.of(context).tr('debug.title'),
      body: Column(
        children: <Widget>[
          _languageSwitchBuilder(context),
          /*_navigationBarTestBuilder(),
            RaisedButton(
              child: Text('SignInPage'),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/signin'),
            )*/
        ],
      ),
    );
  }

  Widget _languageSwitchBuilder(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    var supportedLanguages = Localization.supportedLanguages;

    return EasyLocalizationProvider(
      data: data,
      child: FutureBuilder<String>(
          future: Localization.recommendedLocale(),
          builder: (context, recommendedLocale) => UListSelect(
                AppLocalizations.of(context).tr('debug.language'),
                onPressed:
                    recommendedLocale.connectionState == ConnectionState.waiting
                        ? null
                        : () => _showLanguagesListDialog(context,
                            supportedLanguages, recommendedLocale.data, data),
                value: supportedLanguages[
                    AppLocalizations.of(context).locale.languageCode],
                iconData: MdiIcons.earth,
              )),
    );
  }

  Future _showLanguagesListDialog(
    BuildContext context,
    Map<String, String> supportedLanguages,
    String recommendedLocale,
    data,
  ) {
    String recommendLanguage =
        _getRecommendedLanguage(context, supportedLanguages, recommendedLocale);
    return showSelectionDialog(
      context,
      actions: [recommendLanguage] + _getNameLanguages(supportedLanguages),
    ).then((value) {
      if (value == null) return;
      String locale;

      if (value == recommendLanguage)
        locale = recommendedLocale;
      else
        locale = supportedLanguages.keys
            .firstWhere((key) => supportedLanguages[key] == value);
      data.changeLocale(Locale(locale));
    });
  }

  String _getRecommendedLanguage(
    BuildContext context,
    Map<String, String> supportedLanguages,
    String locale,
  ) =>
      AppLocalizations.of(context).tr('settings.recommended') +
      " (" +
      supportedLanguages[locale] +
      ")";

  List<String> _getNameLanguages(Map<String, String> languages) =>
      List.generate(
          languages.length, (int index) => languages.values.toList()[index]);
}
