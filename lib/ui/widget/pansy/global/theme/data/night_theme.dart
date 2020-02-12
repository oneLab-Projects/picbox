import 'package:flutter/material.dart';
import 'package:picbox/ui/widget/design/style.dart';

/// Хранит [ThemeData] в стиле ночной темы приложения.
final ThemeData nightTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: Style.textTheme,
  primaryColor: Colors.grey[200],
  scaffoldBackgroundColor: Color(0xFF1E1E1E),
  cursorColor: Colors.grey[500],
  disabledColor: Color(0xFF252525),
  cardColor: Color(0xFF272727),
  splashColor: Colors.black.withAlpha(25),
  highlightColor: Colors.black.withAlpha(25),
  dividerColor: Colors.black.withAlpha(75),
);
