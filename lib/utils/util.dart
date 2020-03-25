import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../style/color.dart';
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

// 底部消息弹出框
void toast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    // 消息框弹出的位置
    timeInSecForIos: 5,
    // 消息框持续的时间（目前的版本只有ios有效）
    backgroundColor: string2Color(primaryColor),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}



