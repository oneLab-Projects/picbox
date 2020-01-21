import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/ui/widget/design/style.dart';

import 'component/routes.dart';
import 'ui/global/application.dart';
import 'ui/widget/design/clear_behavior.dart';

/// Запускает приложение, инициализирует [App].
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Application(
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
