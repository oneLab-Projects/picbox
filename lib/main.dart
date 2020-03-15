import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'component/routes.dart';
import 'ui/global/aggregate_data.dart';

/// Запускает приложение, инициализирует [App].
void main() {
  runApp(
    AggregateData(
      pathToLanguages: 'resources/lang/',
      builder: (context, initData) {
        return App(initData);
      },
    ),
  );
}

/// [App] является основным виджетом приложения. Его цель состоит в том, чтобы
/// отобразить интерфейс приложения, предварительно подключив BLoC провайдеры
/// и поддержку мультиязычности.
class App extends StatelessWidget {
  final AggregateDataModel initData;
  App(this.initData) : assert(initData != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ClearBehavior(),
          child: child,
        );
      },
      title: 'Picbox',
      debugShowCheckedModeBanner: false,
      theme: initData.themeData,
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      onGenerateRoute: (RouteSettings routeSettings) =>
          RouteNavigator.onGenerateRoute(routeSettings, Routes.aliases),
    );
  }
}
