import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localizations_delegates.dart';
import './bloc.dart';

/// Создаёт BLoC для реализации смены локализации в приложении.
class LocalizationsBloc extends Bloc<LocalizationsEvent, Locale> {
  static const String LOCALE = "LocalizationsBloc_LOCALE";
  SharedPreferences prefs;

  LocalizationsBloc() {
    _loadSettings();
  }

  @override
  Locale get initialState => Locale('en');

  @override
  Stream<Locale> mapEventToState(LocalizationsEvent event) async* {
    yield event.locale;
    await _saveSettings(event.locale);
  }

  /// Загружает настройки локализации.
  void _loadSettings() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(LOCALE) ??
        (await LocalizationsDelegates.instance.recommendedLocale());
    add(LocaleChanged(locale: Locale(languageCode)));
  }

  /// Сохраняет настройки локализации.
  Future _saveSettings(Locale locale) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    await prefs.setString(LOCALE, locale.languageCode);
  }
}
