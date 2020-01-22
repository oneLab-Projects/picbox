import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class LocalizationsEvent extends Equatable {
  const LocalizationsEvent(this.locale);

  final Locale locale;

  @override
  List<Object> get props => [locale];
}

/// Определяет модель события изменения локализации.
class LocaleChanged extends LocalizationsEvent {
  LocaleChanged({@required Locale locale}) : super(locale);

  @override
  String toString() => 'LocaleChanged { locale: $locale }';
}
