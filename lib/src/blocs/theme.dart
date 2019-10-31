import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picbox/src/common/design/themes/day.dart';
import 'package:picbox/src/common/design/themes/night.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(this._isNight);

  bool _isNight;

  bool get isNight => _isNight;

  getTheme() => _isNight ? themeNight() : themeDay();

  switchToNight(bool value) {
    _isNight = value;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: _isNight ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.grey[850],
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    notifyListeners();
  }
}
