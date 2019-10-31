import 'package:flutter/material.dart';
import 'package:picbox/src/common/design/themes/day.dart';
import 'package:picbox/src/common/design/themes/night.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(this._isNight);

  bool _isNight;

  bool get isNight => _isNight;

  getTheme() => _isNight ? themeNight() : themeDay();

  switchToNight(bool value) {
    _isNight = value;
    notifyListeners();
  }
}
