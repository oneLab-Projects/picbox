import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/component/routes.dart';
import 'package:picbox/src/common/design/clear_behavior.dart';
import 'package:picbox/src/common/design/style.dart';
import 'package:picbox/ui/global/application.dart';

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
          routes: Routes.routes,
        );
      },
    );
  }

  /// Стилизирует StatusBar и SystemNavigationBar с помощью [SystemChrome]
  void paintUiOverlay(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Style.bottomNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
