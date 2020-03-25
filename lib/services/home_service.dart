import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../conf/service_url.dart';
import 'me_service.dart';
import 'dart:convert';

// 获取今明两天电价展示内容
Future electricityElectricityPrice(String city) async {
  try {
    print('开始获取电价展示');

    DateTime now = new DateTime.now();
    DateTime startTime = now.subtract(Duration(days: 1));
    DateTime endTime = now.add(Duration(days: 1));

    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.json;
    var jsonData = {
      'city': city,
      'startTime': startTime.toString().split(' ')[0],
      'endTime': endTime.toString().split(' ')[0],
    };
    response = await dio.post(servicePath['electricity/electricityPrice'],
        data: jsonData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口抛出异常');
    }
  } catch (e) {
    return print('ERROR:==========>${e}');
  }
}

// 获取红包
Future activityRedPaper() async {
  print('开始获取红包展示');
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

      response = await dio.get(servicePath['activity/redPaper']);
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
