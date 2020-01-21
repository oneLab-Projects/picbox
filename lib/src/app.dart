import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picbox/component/routes.dart';
import 'package:picbox/src/common/design/clear_behavior.dart';
import 'package:picbox/src/common/design/style.dart';
import 'package:picbox/src/pages/root.dart';
import 'package:picbox/ui/global/localizations/bloc/bloc.dart';
import 'package:picbox/ui/global/localizations/localizations_delegates.dart';
import 'package:picbox/ui/global/theme/bloc/bloc.dart';
import 'package:picbox/ui/global/theme/data/night_theme.dart';

/// [App] является основным виджетом приложения. Его цель состоит в том, чтобы
/// присоединить к приложению BLoC-провайдеры.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<LocalizationsBloc>(
          create: (BuildContext context) => LocalizationsBloc(),
        ),
      ],
      child: AppWithBlocs(),
    );
  }
}

/// [App] является вспомогательным виджетом приложения. Его цель состоит в том, чтобы
/// отобразить интерфейс приложения, предварительно сделав стилизацию [SystemChrome],
/// а также подключив поддержку мультиязычности и смены темы.
class AppWithBlocs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationsDelegates localizations = LocalizationsDelegates.instance;
    return BlocBuilder<LocalizationsBloc, Locale>(
      builder: (context, locale) {
        return BlocBuilder<ThemeBloc, ThemeData>(
          builder: (context, theme) {
            paintUiOverlay(theme);
            return MaterialApp(
              localizationsDelegates: localizations.localizationsDelegates,
              supportedLocales: localizations.supportedLocales,
              locale: locale,
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
              routes: Routes.routes,
            );
          },
        );
      },
    );
  }

  /// Стилизирует StatusBar и SystemNavigationBar с помощью [SystemChrome]
  /// Принимает `theme` для того, чтобы определить, какого типа (`day`, `night`) в данный момент активна тема приложения.
  void paintUiOverlay(ThemeData theme) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            theme == nightTheme ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Style.bottomNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
