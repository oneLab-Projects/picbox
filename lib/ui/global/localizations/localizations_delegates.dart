import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

class LocalizationsDelegates {
  static LocalizationsDelegates _instance;

  List<Locale> _supportedLocales;
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

  Future<String> recommendedLocale() async {
    String language = (await Devicelocale.currentLocale).substring(0, 2);
    return _supportedLanguages.containsKey(language) ? language : 'en';
  }

  bool isSupported(Locale locale) {
    return _supportedLanguages.keys.contains(locale.languageCode);
  }

  static LocalizationsDelegates get instance {
    if (_instance == null) {
      _instance = LocalizationsDelegates();
    }
    return _instance;
  }

  List<LocalizationsDelegate> get localizationsDelegates =>
      _localizationsDelegates;

  List<Locale> get supportedLocales => _supportedLocales;

  Map<String, String> get supportedLanguages => _supportedLanguages;
}
