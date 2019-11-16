import 'package:flutter/material.dart';
import 'package:picbox/src/common/design/style.dart';

ThemeData themeNight() => ThemeData(
      brightness: Brightness.dark,
      cardColor: Color(0xFFC7C7C7),
      highlightColor: Color(0xFF252525),
      scaffoldBackgroundColor: Color(0xFF1E1E1E),
      textTheme: Style.textTheme,
    );
