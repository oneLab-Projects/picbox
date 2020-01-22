import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/ui/widget/design/style.dart';

import 'component/routes.dart';
import 'ui/global/aggregate_data.dart';
import 'ui/widget/design/clear_behavior.dart';

/// Запускает приложение, инициализирует [App].
void main() => runApp(App());

/// [App] является основным виджетом приложения. Его цель состоит в том, чтобы
/// отобразить интерфейс приложения, предварительно сделав стилизацию [SystemChrome],
/// а также подключив поддержку мультиязычности и смены темы.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AggregateData(
      builder: (bCtx, initData) {
        paintUiOverlay(initData.themeData.brightness);
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

  /// Стилизирует StatusBar и SystemNavigationBar с помощью [SystemChrome]
  void paintUiOverlay(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Style.bottomNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
