import 'package:flutter/material.dart';

import 'localizations/ui/locale_bloc_builder.dart';
import 'theme/ui/theme_bloc_builder.dart';

class Application extends StatelessWidget {
  final Widget Function(BuildContext context, InitData initData) builder;

  Application({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return LocaleBlocBuilder(
      builder: (lBBContext, locale, supportedLocales, localizationsDelegates) {
        return ThemeBlocBuilder(
          builder: (tBBContext, themeData) {
            InitData initData = InitData(
                themeData, locale, supportedLocales, localizationsDelegates);
            return builder(tBBContext, initData);
          },
        );
      },
    );
  }
}

class InitData {
  ThemeData themeData;
  Locale locale;
  List<Locale> supportedLocales;
  List<LocalizationsDelegate> localizationsDelegates;
  Function localeResolutionCallback;

  InitData(this.themeData, this.locale, this.supportedLocales,
      this.localizationsDelegates);
}
