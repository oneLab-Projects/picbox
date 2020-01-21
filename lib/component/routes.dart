import 'package:flutter/widgets.dart';
import 'package:picbox/ui/feature/debug/debug_page.dart';
import 'package:picbox/ui/feature/landing/confirm_page.dart';
import 'package:picbox/ui/feature/landing/signin_page.dart';
import 'package:picbox/ui/feature/landing/signup_page.dart';
import 'package:picbox/ui/feature/root.dart';
import 'package:picbox/ui/feature/settings/settings_page.dart';
import 'package:picbox/ui/global/localizations/ui/localizations_setting_page.dart';
import 'package:picbox/ui/widget/pansy.dart';

class Routes {
  static const String ROOT = '/';
  static const String DEBUG = '/debug';
  static const String SETTINGS = '/settings';
  static const String SETTINGS_LOCALIZATIONS = '/settings/localizations';
  static const String LANDING_SIGNIN = '/landing/signin';
  static const String LANDING_SIGNUP = '/landing/signup';
  static const String LANDING_CONFIRM = '/landing/confirm';

  static var routes = {
    ROOT: RootPage(),
    DEBUG: DebugPage(),
    SETTINGS: SettingsPage(),
    SETTINGS_LOCALIZATIONS: LocalizationsSettingPage(),
    LANDING_SIGNIN: SignInPage(),
    LANDING_SIGNUP: SignUpPage(),
    LANDING_CONFIRM: ConfirmPage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (int i = 0; i < routes.length; i++) {
      String key = routes.keys.toList()[i];
      if (settings.name == key)
        return UPageRoute(
            builder: (context) => routes[key], settings: settings);
    }
    throw UnsupportedError('Unknown route: ${settings.name}');
  }

  static Route<dynamic> onGenerateRouteForNestedNavigator(
      RouteSettings settings, dynamic routeBuilder) {
    for (int i = 0; i < routes.length; i++) {
      String key = routes.keys.toList()[i];
      if (settings.name == key)
        return UPageRoute(
            builder: (context) => settings.name == Routes.ROOT
                ? routeBuilder(key)(context)
                : routes[key],
            settings: settings);
    }
    throw UnsupportedError('Unknown route: ${settings.name}');
  }
}
