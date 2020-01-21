import 'package:picbox/ui/feature/debug/debug.dart';
import 'package:picbox/ui/feature/landing/confirm_page.dart';
import 'package:picbox/ui/feature/landing/signin_page.dart';
import 'package:picbox/ui/feature/landing/signup_page.dart';
import 'package:picbox/ui/feature/root.dart';
import 'package:picbox/ui/feature/settings/settings_page.dart';
import 'package:picbox/ui/global/localizations/ui/localizations_setting_page.dart';

class Routes {
  static const String ROOT = '/';
  static const String DEBUG = '/debug';
  static const String SETTINGS = '/settings';
  static const String SETTINGS_LOCALIZATIONS = '/settings/localizations';
  static const String LANDING_SIGNIN = '/landing/signin';
  static const String LANDING_SIGNUP = '/landing/signup';
  static const String LANDING_CONFIRM = '/landing/confirm';

  static var routes = {
    ROOT: (context) => RootPage(),
    DEBUG: (context) => DebugPage(),
    SETTINGS: (context) => SettingsPage(),
    SETTINGS_LOCALIZATIONS: (context) => LocalizationsSettingPage(),
    LANDING_SIGNIN: (context) => SignInPage(),
    LANDING_SIGNUP: (context) => SignUpPage(),
    LANDING_CONFIRM: (context) => ConfirmPage(),
  };
}
