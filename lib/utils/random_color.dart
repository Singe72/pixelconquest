import "dart:math";
import "dart:ui";

Color generateRandomColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
      .withOpacity(1.0);
}
