import 'package:flutter/material.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:easy_localization/easy_localization.dart';

/// Страница `Язык интерфейса`.
class LocalizationsSettingPage extends StatefulWidget {
  @override
  _LocalizationsSettingPageState createState() =>
      _LocalizationsSettingPageState();
}

class _LocalizationsSettingPageState extends State<LocalizationsSettingPage> {
  Map<Locale, String> _supportedLocales;
  Locale _locale = Locale(null);

  @override
  Widget build(BuildContext context) {
    var supportedLocalesWithName = _supportedLocales;
    return UScaffold(
      title: 'settings.localizations.title'.tr(),
      body: Column(
        children: <Widget>[
          UListContent(
            'settings.localizations.recommended'.tr(),
            variant: true,
            child: _getRecommendedLanguages(context, supportedLocalesWithName),
          ),
          Divider(),
          UListContent(
            'settings.localizations.all_languages'.tr(),
            variant: true,
            child: _getAllAppLanguages(context, supportedLocalesWithName),
          ),
        ],
      ),
    );
  }

  /// Получает рекомендованные языки.
  Widget _getRecommendedLanguages(
    BuildContext context,
    Map<Locale, String> supportedLocalesWithName,
  ) {
    return Column(
      children: <Widget>[
        if (_locale != Locale('en') && _locale != Locale(null))
          _buildWidget(
            context,
            supportedLocalesWithName[_locale],
            Localizations.localeOf(context) == _locale,
          ),
        if (_locale == Locale(null))
          _buildWidget(context, "Loading", false, enabled: false),
        _buildWidget(
          context,
          supportedLocalesWithName[Locale('en')],
          Localizations.localeOf(context) == Locale('en'),
        ),
      ],
    );
  }

  /// Получает все языки, поддерживаемые приложением.
  Widget _getAllAppLanguages(
    BuildContext context,
    Map<Locale, String> supportedLocalesWithName,
  ) {
    return Column(
      children: List.generate(supportedLocalesWithName.length, (int index) {
        bool checked = Localizations.localeOf(context) ==
            supportedLocalesWithName.keys.toList()[index];
        return _buildWidget(
          context,
          supportedLocalesWithName.values.toList()[index],
          checked,
        );
      }),
    );
  }

  Widget _buildWidget(
    BuildContext context,
    String title,
    bool checked, {
    bool enabled = true,
  }) {
    return InkWell(
      onTap: () {
        if (!enabled || checked) return;
        var supportedLocalesWithName = _supportedLocales;
        Locale result = supportedLocalesWithName.keys
            .firstWhere((key) => supportedLocalesWithName[key] == title);

        EasyLocalization.of(context).locale = result;
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
}
