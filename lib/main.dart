import 'package:flutter/material.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/routes.dart';

/// Запускает приложение, инициализирует [App].
void main() => runApp(App());

/// [App] является основным виджетом приложения. Его цель состоит в том, чтобы
/// отобразить интерфейс приложения, предварительно подключив поддержку мультиязычности и смены темы.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AggregateData(
      builder: (bCtx, initData) {
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
          locale: initData.locale,
          supportedLocales: initData.supportedLocales,
          localizationsDelegates: initData.localizationsDelegates,
          onGenerateRoute: Routes.onGenerateRoute,
        );
      },
    );
  }
}
