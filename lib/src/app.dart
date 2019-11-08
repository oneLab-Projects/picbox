import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/blocs/theme/night.dart';
import 'package:picbox/src/common/design/clear_behavior.dart';
import 'package:picbox/src/common/design/colors.dart';
import 'package:picbox/src/pages/main.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      builder: (_) => ThemeBloc(),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(builder: (context, theme) {
      paintUiOverlay(theme);
      return MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: ClearBehavior(),
            child: child,
          );
        },
        title: 'Picbox',
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: MainPage(),
      );
    });
  }

  void paintUiOverlay(ThemeData theme) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            theme == themeNight() ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: ColorPalette.bottomNavigation,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
