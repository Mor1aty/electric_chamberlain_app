import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../model/user_info.dart';
import '../conf/service_url.dart';

// 获取 UserInfo
Future getUserInfo() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs = await _prefs;
  String userInfo = prefs.getString("user_info");
  return userInfo;
}

// 存储 UserInfo
void saveUserInfo(UserInfo userInfo) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs = await _prefs;
  prefs.setString("user_info", jsonEncode(userInfo));
}

// 删除 UserInfo
void removeUserInfo() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs = await _prefs;
  prefs.remove("user_info");
}

// 手机验证码登录
Future userPhone(String phone, int code) async {
  try {
    print('开始手机验证码登录');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.json;
    var jsonData = {
      'phone': phone,
      'code': code,
    };
    response = await dio.post(servicePath['user/phone'], data: jsonData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口抛出异常');
    }
  } catch (e) {
    return print('ERROR:==========>${e}');
  }
}

// 修改密码
Future userNickname(String nickname) async {
  print('开始修改昵称');
  return getUserInfo().then((val) async {
    try {
      if (val == null || jsonDecode(val)['token'].toString().isEmpty) {
        return null;
      }
      Response response;
      Dio dio = new Dio();
      dio.options.contentType = ContentType.parse('application/json');
      dio.options.headers = {
        'Authorization': jsonDecode(val)['token'].toString(),
        'Accept': 'application/json'
      };
      var jsonData = {
        'nickname': nickname,
      };
      response = await dio.put(servicePath['user/nickname'], data: jsonData);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('后端接口抛出异常');
      }
    } catch (e) {
      return print('ERROR:==========>${e}');
    }
  });
}
