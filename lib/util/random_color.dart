import 'dart:math';
import 'dart:ui';

/// Вспомогательный касс, предназначенный для работы с цветом.
class ColorTool {
  static Random random = Random();

  /// Возвращает случайный, яркий цвет.
  static Color getBrightColor() {
    return Color.fromARGB(255, 100 + random.nextInt(155),
        100 + random.nextInt(55), 100 + random.nextInt(155));
  }

  /// Возвращает случайный, тёмный цвет.
  static Color getDarkColor() {
    return Color.fromARGB(255, 0 + random.nextInt(55), 0 + random.nextInt(55),
        0 + random.nextInt(55));
  }

  /// Возвращает тёмный вариант указанного цвета.
  static Color toDarkColor(Color color) {
    return Color.fromARGB(
        color.alpha, color.red - 100, color.green - 100, color.blue - 100);
  }
}
