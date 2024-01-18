import 'dart:ui';
import 'dart:math';

Color pickTextColorBasedOnBgColor(
    Color bgColor, Color lightColor, Color darkColor) {
  var r = bgColor.red / 255;
  var g = bgColor.green / 255;
  var b = bgColor.blue / 255;
  var uicolors = [r, g, b];
  var c = uicolors.map((col) {
    if (col <= 0.03928) {
      return col / 12.92;
    }
    return pow((col + 0.055) / 1.055, 2.4);
  }).toList();
  var L = (0.2126 * c[0]) + (0.7152 * c[1]) + (0.0722 * c[2]);
  return (L > 0.179) ? darkColor : lightColor;
}
