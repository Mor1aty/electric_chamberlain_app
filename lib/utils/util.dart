import 'package:flutter/cupertino.dart';

// 颜色转换工具
Color string2Color(String colorStr) {
  int value = 0x00000000;

  if (colorStr != null && colorStr != "") {
    if (colorStr[0] == '#') {
      colorStr = colorStr.substring(1);
    }
    value = int.tryParse(colorStr, radix: 16);
    if (value != null) {
      if (value <= 0xFF000000) {
        value += 0xFF000000;
      }
    }
  }
  return Color(value);
}
