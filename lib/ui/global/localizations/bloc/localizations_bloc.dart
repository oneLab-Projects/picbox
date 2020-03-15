import 'package:flutter/widgets.dart';
import 'package:pansy_ui/pansy_ui/util/localizations.dart';
import 'package:rxdart/rxdart.dart';

class LocalizationsBloc {
  Map<Locale, String> supportedLocales;
  Locale recommendedLocale;
  BehaviorSubject<bool> _statusStream = BehaviorSubject<bool>.seeded(false);

  LocalizationsBloc(BuildContext context, String path) {
    LocalizationTools.getSupportedLocales(context, path).then((value) {
      supportedLocales = value;
      recommendedLocale = LocalizationTools.recommendedLocale(
        supportedLocales.keys.toList(),
      );

      _statusStream.sink.add(true);
    });
  }

  Stream<bool> get isLoaded => _statusStream.stream;

  void dispose() => _statusStream.close();
}
