import 'package:flutter/material.dart';
import 'localizations/ui/locale_bloc_builder.dart';
import 'theme/ui/theme_bloc_builder.dart';

/// [AggregateData] является виджетом, цель которого – предоставить данные
/// BLoC-билдеров, необходимые для MaterialApp.
class AggregateData extends StatelessWidget {
  final Widget Function(BuildContext context, AggregateDataModel initData)
      builder;

  AggregateData({@required this.builder}) : assert(builder != null);

  @override
  Widget build(BuildContext context) {
    return LocaleBlocBuilder(
      builder: (lBBContext, locale, supportedLocales, localizationsDelegates) {
        return ThemeBlocBuilder(
          builder: (tBBContext, themeData) {
            AggregateDataModel initData = AggregateDataModel(
                themeData, locale, supportedLocales, localizationsDelegates);
            return builder(tBBContext, initData);
          },
        );
      },
    );
  }
}

/// Модель представления данных для [AggregateData].
class AggregateDataModel {
  ThemeData themeData;
  Locale locale;
  List<Locale> supportedLocales;
  List<LocalizationsDelegate> localizationsDelegates;
  Function localeResolutionCallback;

  AggregateDataModel(this.themeData, this.locale, this.supportedLocales,
      this.localizationsDelegates);
}
