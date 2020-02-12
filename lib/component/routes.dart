import 'package:flutter/widgets.dart';
import 'package:picbox/ui/feature/debug/debug_page.dart';
import 'package:picbox/ui/feature/root.dart';
import 'package:picbox/ui/feature/settings/settings_page.dart';
import 'package:picbox/ui/global/localizations/ui/localizations_setting_page.dart';
import 'package:picbox/ui/widget/pansy.dart';

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
  static var _routes = {
    ROOT: RootPage(),
    DEBUG: DebugPage(),
    SETTINGS: SettingsPage(),
    SETTINGS_LOCALIZATIONS: LocalizationsSettingPage(),
  };

  /// Callback-генератор маршрутов. Используется, когда приложение перемещается по названному маршруту.
  static Route<dynamic> onGenerateRoute(
    RouteSettings settings, [
    Function routeBuilder,
  ]) {
    String key = _routes.keys
        .firstWhere((key) => key == settings.name, orElse: () => null);
    if (key == null) throw UnsupportedError('Unknown route: ${settings.name}');

    return UPageRoute(
        builder: (context) => settings.name == ROOT && routeBuilder != null
            ? routeBuilder(context)
            : _routes[key],
        settings: settings);
  }
}
