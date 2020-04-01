import 'package:flutter/material.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

/// Страница `Язык интерфейса`.
class LocalizationsSettingPage extends StatefulWidget {
  @override
  _LocalizationsSettingPageState createState() =>
      _LocalizationsSettingPageState();
}

class _LocalizationsSettingPageState extends State<LocalizationsSettingPage> {
  LocalizationsBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<LocalizationsBloc>(context);

    return UScaffold(
      title: 'settings.localizations.title'.tr(),
      body: Column(
        children: <Widget>[
          UListContent(
            'settings.localizations.recommended'.tr(),
            variant: true,
            child: _getRecommendedLanguages(context, bloc.supportedLocales),
          ),
          Divider(),
          UListContent(
            'settings.localizations.all_languages'.tr(),
            variant: true,
            child: _getAllAppLanguages(context, bloc.supportedLocales),
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
        if (bloc.recommendedLocale != Locale('en'))
          _buildWidget(
            context,
            supportedLocalesWithName[bloc.recommendedLocale],
            Localizations.localeOf(context) == bloc.recommendedLocale,
          ),
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
        Locale result = bloc.supportedLocales.keys
            .firstWhere((key) => bloc.supportedLocales[key] == title);

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
