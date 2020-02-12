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
  void onTransition(Transition<ThemeEvent, ThemeData> transition) {
    super.onTransition(transition);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: transition.nextState == nightTheme
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: transition.nextState.scaffoldBackgroundColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == nightTheme ? dayTheme : nightTheme;
        await _saveSettings(state == nightTheme);
        break;

      case ThemeEvent.night:
        yield nightTheme;
        await _saveSettings(true);
        break;

      case ThemeEvent.day:
        yield dayTheme;
        await _saveSettings(false);
        break;
    }
  }

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
