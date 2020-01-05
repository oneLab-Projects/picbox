import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/constants.dart';
import 'package:picbox/src/common/design/clear_behavior.dart';
import 'package:picbox/src/common/design/colors.dart';
import 'package:picbox/src/pages/root.dart';

/// [App] является основным виджетом приложения. Его цель состоит в том, чтобы
/// присоединить к приложению BLoC-провайдеры.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            builder: (BuildContext context) => ThemeBloc(),
          ),
        ],
        child: AppWithBlocs(),
      ),
    );
  }
}

/// [App] является вспомогательным виджетом приложения. Его цель состоит в том, чтобы
/// отобразить интерфейс приложения, предварительно сделав стилизацию [SystemChrome],
/// а также подключив поддержку мультиязычности и смены темы.
class AppWithBlocs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    var supportedLanguages = Constants.supportedLanguages;

    return EasyLocalizationProvider(
      data: data,
      child: BlocBuilder<ThemeBloc, ThemeData>(builder: (context, theme) {
        paintUiOverlay(theme);
        return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            EasylocaLizationDelegate(
              locale: data.locale,
              path: 'resources/langs',
              useOnlyLangCode: true,
            ),
          ],
          supportedLocales: List.generate(supportedLanguages.length,
              (int index) => Locale(supportedLanguages.keys.toList()[index])),
          locale: data.savedLocale,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: ClearBehavior(),
              child: child,
            );
          },
          title: 'Picbox',
          debugShowCheckedModeBanner: false,
          theme: theme,
          initialRoute: '/',
          routes: {
            '/': (context) => RootPage(),
          },
        );
      }),
    );
  }

  /// Стилизация StatusBar и SystemNavigationBar с помощью [SystemChrome]
  /// Принимает `theme` для того, чтобы определить, какого типа (`day`, `night`) в данный момент активна тема приложения.
  void paintUiOverlay(ThemeData theme) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            theme == themeNight ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: ColorPalette.bottomNavigation,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
