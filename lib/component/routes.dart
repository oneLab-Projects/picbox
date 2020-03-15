import 'package:picbox/ui/feature/debug/debug_page.dart';
import 'package:picbox/ui/feature/root.dart';
import 'package:picbox/ui/feature/settings/localizations_settings_page.dart';
import 'package:picbox/ui/feature/settings/settings_page.dart';

/// Класс для работы с маршрутами.
class Routes {
  /// Путь до главной страницы приложения.
  static const String ROOT = '/';

  /// Путь до страницы `Для разработчиков`.
  static const String DEBUG = '/debug';

  /// Путь до страницы `Настройки`.
  static const String SETTINGS = '/settings';

  /// Путь до страницы `Язык интерфейса`.
  static const String SETTINGS_LOCALIZATIONS = '/settings/localizations';

  /// Путь до страницы `Авторизация`.
  static const String LANDING_SIGNIN = '/landing/signin';

  /// Путь до страницы `Регистрация`.
  static const String LANDING_SIGNUP = '/landing/signup';

  /// Путь до страницы `Подтверждение`.
  static const String LANDING_CONFIRM = '/landing/confirm';

  /// Хранит алиасы маршрутов.
  static var aliases = {
    ROOT: RootPage(),
    DEBUG: DebugPage(),
    SETTINGS: SettingsPage(),
    SETTINGS_LOCALIZATIONS: LocalizationsSettingPage(),
  };
}
