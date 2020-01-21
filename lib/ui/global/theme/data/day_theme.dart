import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/design/style.dart';

/// Хранит [ThemeData] в стиле дневной темы приложения.
final ThemeData dayTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: Style.textTheme,
  primaryColor: Colors.grey[800],
  scaffoldBackgroundColor: Color(0xFFF8F8F8),
  cursorColor: Colors.grey[800],
  disabledColor: Colors.grey[200],
  cardColor: Color(0xFFECECEC),
  splashColor: Colors.black.withAlpha(10),
  highlightColor: Colors.black.withAlpha(10),
);
