import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/src/blocs/theme.dart';
import 'package:picbox/src/common/design/clear_behavior.dart';
import 'package:picbox/src/pages/main.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.grey[900],
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(false),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ClearBehavior(),
          child: child,
        );
      },
      title: 'Picbox',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: theme.getTheme(),
    );
  }
}
