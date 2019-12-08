import 'package:flutter/material.dart';
import 'package:picbox/src/common/design/style.dart';

final ThemeData themeNight = ThemeData(
  brightness: Brightness.dark,
  textTheme: Style.textTheme,
  primaryColor: Colors.grey[200],
  scaffoldBackgroundColor: Color(0xFF1E1E1E),
  cursorColor: Colors.grey[500],
  disabledColor: Color(0xFF252525),
  splashColor: Colors.black12,
  highlightColor: Colors.black12,
);
