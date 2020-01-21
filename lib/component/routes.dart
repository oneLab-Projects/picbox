import 'package:picbox/src/pages/landing/confirm.dart';
import 'package:picbox/src/pages/landing/signin.dart';
import 'package:picbox/src/pages/landing/signup.dart';
import 'package:picbox/src/pages/profile/debug.dart';
import 'package:picbox/src/pages/profile/settings.dart';
import 'package:picbox/src/pages/root.dart';
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
