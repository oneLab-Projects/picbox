import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:picbox/src/common/localization.dart';
import 'package:picbox/src/common/widgets.dart';

/// Страница `Язык интерфейса`
class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String locale = 'loading';

  @override
  void initState() {
    super.initState();
    Localization.recommendedLocale().then(
      (value) => setState(() => locale = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    var supportedLanguages = Localization.supportedLanguages;
    return UScaffold(
      title: AppLocalizations.of(context).tr('settings.language.title'),
      body: Column(
        children: <Widget>[
          UListContent(
            AppLocalizations.of(context).tr('settings.language.recommended'),
            variant: true,
            child: _getRecommendedLanguages(context, supportedLanguages),
          ),
          Divider(),
          UListContent(
            AppLocalizations.of(context).tr('settings.language.all_languages'),
            variant: true,
            child: _getAllLanguages(context, supportedLanguages),
          ),
        ],
      ),
    );
  }

  Widget _getRecommendedLanguages(
    BuildContext context,
    Map<String, String> supportedLanguages,
  ) {
    return Column(
      children: <Widget>[
        if (locale != 'en' && locale != 'loading')
          _buildWidget(context, supportedLanguages[locale],
              Localizations.localeOf(context).languageCode == locale),
        if (locale == 'loading')
          _buildWidget(context, "Loading", false, enabled: false),
        _buildWidget(context, supportedLanguages['en'],
            Localizations.localeOf(context).languageCode == 'en'),
      ],
    );
  }

  Widget _getAllLanguages(
    BuildContext context,
    Map<String, String> supportedLanguages,
  ) =>
      Column(
        children: List.generate(supportedLanguages.length, (int index) {
          bool checked = Localizations.localeOf(context).languageCode ==
              supportedLanguages.keys.toList()[index];
          return _buildWidget(
            context,
            supportedLanguages.values.toList()[index],
            checked,
          );
        }),
      );

  Widget _buildWidget(
    BuildContext context,
    String title,
    bool checked, {
    bool enabled = true,
  }) =>
      InkWell(
        onTap: !enabled || checked
            ? null
            : () {
                var data = EasyLocalizationProvider.of(context).data;
                var supportedLanguages = Localization.supportedLanguages;

                String result = supportedLanguages.keys
                    .firstWhere((key) => supportedLanguages[key] == title);
                data.changeLocale(Locale(result));
              },
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).textTheme.button.color,
                        ),
                  ),
                ),
                if (checked) Icon(Icons.check),
              ],
            ),
          ),
        ),
      );
}
