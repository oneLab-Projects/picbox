import 'dart:math';
import 'dart:ui';

class RandomColor {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(255, 100 + random.nextInt(155),
        100 + random.nextInt(55), 100 + random.nextInt(155));
  }
}
