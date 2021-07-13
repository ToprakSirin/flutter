import 'dart:ui';

import 'package:flutter/foundation.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor({@required final String hexColor})
      : super(_getColorFromHex(hexColor));
}
