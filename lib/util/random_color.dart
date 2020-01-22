import 'dart:math';
import 'dart:ui';

/// Класс, предназначенный для генерации цвета.
class RandomColor {
  static Random random = new Random();

  /// Возвращает случайный, яркий цвет.
  static Color getBrightColor() {
    return Color.fromARGB(255, 100 + random.nextInt(155),
        100 + random.nextInt(55), 100 + random.nextInt(155));
  }
}
