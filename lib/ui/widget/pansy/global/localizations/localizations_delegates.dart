import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

/// Фабрика для набора локализованных ресурсов типа T, загружаемых виджетом [AppLocalizations].
class LocalizationsDelegates {
  static LocalizationsDelegates _instance;

  /// Хранит перечисление поддерживаемых локалей.
  List<Locale> _supportedLocales;

  /// Хранит перечисление поддерживаемых языков в формате `localeCode`: `name`.
  static Map<String, String> _supportedLanguages = {
    'en': 'English',
    'ru': 'Русский',
    'ar': 'Отзеркаленный'
  };

  List<LocalizationsDelegate<dynamic>> _localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  LocalizationsDelegates() {
    _supportedLocales = List.generate(_supportedLanguages.length,
        (int index) => Locale(_supportedLanguages.keys.toList()[index]));
  }

  /// Возвращает наиболее подходящий язык для пользователя,
  /// основываясь на локализации устройства.
  Future<String> recommendedLocale() async {
    String language = (await Devicelocale.currentLocale).substring(0, 2);
    return _supportedLanguages.containsKey(language) ? language : 'en';
  }

  bool isSupported(Locale locale) {
    return _supportedLanguages.keys.contains(locale.languageCode);
  }

  static LocalizationsDelegates get instance {
    _instance ??= LocalizationsDelegates();
    return _instance;
  }

  List<LocalizationsDelegate> get localizationsDelegates =>
      _localizationsDelegates;

  List<Locale> get supportedLocales => _supportedLocales;

  Map<String, String> get supportedLanguages => _supportedLanguages;
}
