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
    String language = (await Devicelocale.currentLocale).substring(0, 2);
    return supportedLanguages.containsKey(language) ? language : 'en';
  }
}
