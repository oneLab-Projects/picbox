import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:picbox/ui/widget/pansy/global/theme/data/day_theme.dart';
import 'package:picbox/ui/widget/pansy/global/theme/data/night_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc.dart';

/// Создаёт BLoC для реализации смены темы в приложении.
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  static const String NIGHT_THEME = "ThemeBloc_NIGHT_THEME";
  SharedPreferences prefs;

  ThemeBloc() {
    _loadSettings();
  }

  @override
  ThemeData get initialState => dayTheme;

  /// Стилизирует StatusBar и SystemNavigationBar с помощью [SystemChrome]
  @override
  void onEvent(ThemeEvent event) {
    super.onEvent(event);
    ThemeData theme = eventToTheme(event);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            isNightTheme(theme) ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    yield eventToTheme(event);
    await _saveSettings(isNightTheme(state));
  }

  /// Возвращает [ThemeData], основываясь на [ThemeEvent]
  ThemeData eventToTheme(ThemeEvent event) {
    switch (event) {
      case ThemeEvent.toggle:
        return isNightTheme(state) ? dayTheme : nightTheme;

      case ThemeEvent.night:
        return nightTheme;

      case ThemeEvent.day:
        return dayTheme;

      default:
        return null;
    }
  }

  bool isNightTheme(ThemeData theme) => theme == nightTheme;

  /// Загружает настройки темы.
  void _loadSettings() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    bool nightTheme = prefs.getBool(NIGHT_THEME) ?? false;
    if (nightTheme)
      add(ThemeEvent.night);
    else if (!nightTheme) add(ThemeEvent.day);
  }

  /// Сохраняет настройки темы.
  Future _saveSettings(bool nightTheme) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    await prefs.setBool(NIGHT_THEME, nightTheme);
  }
}
