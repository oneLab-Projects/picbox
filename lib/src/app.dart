import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picbox/src/blocs/navbar.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/constants.dart';
import 'package:picbox/src/common/design/clear_behavior.dart';
import 'package:picbox/src/common/design/colors.dart';
import 'package:picbox/src/pages/landing/signin.dart';
import 'package:picbox/src/pages/root.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          builder: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<NavbarBloc>(
          builder: (BuildContext context) => NavbarBloc(),
        ),
      ],
      child: MaterialAppWithBlocs(),
    );
  }
}

class MaterialAppWithBlocs extends StatelessWidget {
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
