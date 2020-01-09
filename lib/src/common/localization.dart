import 'package:devicelocale/devicelocale.dart';

/// Вспомогательный класс для интернационализации приложения.
class Localization {
  /// Хранит перечисление поддерживаемых языков в формате `code`: `name`
  static Map<String, String> supportedLanguages = {
    'en': 'English',
    'ru': 'Русский',
    'ar': 'Отзеркаленный'
  };

  /// Возвращает наиболее подходящий язык для пользователя,
  /// основываясь на локализации устройства.
  static Future<String> recommendedLocale() async {
    List languages = await Devicelocale.preferredLanguages;
    for (String language in languages) {
      if (language.runes.length != 2) language = language.substring(0, 2);
      if (supportedLanguages.containsKey(language)) return language;
    }
    return 'en';
  }
}
