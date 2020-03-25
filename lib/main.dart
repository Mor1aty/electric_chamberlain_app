import 'package:flutter/material.dart';
import 'utils/util.dart';
import 'loading.dart';
import 'app.dart';
import 'style/color.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ecThemeDate,
      // 路由信息
      routes: <String, WidgetBuilder>{'app': (BuildContext context) => App()},
      home: Loading(),
    ));

// 自定义主题 #0352DB
final ThemeData ecThemeDate = ThemeData(primaryColor: string2Color(primaryColor));
