import 'package:flutter/material.dart';

/// Константы приложения, хранящие к себе информацию,
/// связанную с дизайном приложения.
class Style {
  /// Хранит настроенный под дизайн приложения [TextTheme].
  static const TextTheme textTheme = TextTheme(
    title: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 19,
    ),
    subhead: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 15,
    ),
    button: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 16,
    ),
    caption: TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 13.4,
    ),
  );

  /// Хранит цвет для [BottomNavigationBar]
  static final bottomNavigationBarColor = Color(0xFF2E2E2E);
}
