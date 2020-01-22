import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/pansy.dart';
import 'package:picbox/ui/global/localizations/bloc/bloc.dart';

import '../localizations_delegates.dart';

/// Страница `Язык интерфейса`.
class LocalizationsSettingPage extends StatefulWidget {
  @override
  _LocalizationsSettingPageState createState() =>
      _LocalizationsSettingPageState();
}

class _LocalizationsSettingPageState extends State<LocalizationsSettingPage> {
  LocalizationsDelegates localizations = LocalizationsDelegates.instance;
  String locale = 'loading';

  @override
  void initState() {
    super.initState();
    localizations.recommendedLocale().then(
          (value) => setState(() => locale = value),
        );
  }

  @override
  Widget build(BuildContext context) {
    var supportedLanguages = localizations.supportedLanguages;
    return UScaffold(
      title: AppLocalizations.of(context).tr('settings.localizations.title'),
      body: Column(
        children: <Widget>[
          UListContent(
            AppLocalizations.of(context)
                .tr('settings.localizations.recommended'),
            variant: true,
            child: _getRecommendedLanguages(context, supportedLanguages),
          ),
          Divider(),
          UListContent(
            AppLocalizations.of(context)
                .tr('settings.localizations.all_languages'),
            variant: true,
            child: _getAllAppLanguages(context, supportedLanguages),
          ),
        ],
      ),
    );
  }

  /// Получает рекомендованные языки.
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

  /// Получает все языки, поддерживаемые приложением.
  Widget _getAllAppLanguages(
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
        onTap: () {
          if (!enabled || checked) return;
          var supportedLanguages = localizations.supportedLanguages;
          String result = supportedLanguages.keys
              .firstWhere((key) => supportedLanguages[key] == title);

          BlocProvider.of<LocalizationsBloc>(context).add(
            LocaleChanged(locale: Locale(result)),
          );
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
