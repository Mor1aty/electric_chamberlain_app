import 'package:flutter/material.dart';
import '../../services/home_service.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/color.dart';
import '../../utils/util.dart';

class HomeElecPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var showContent;
    return FutureBuilder(
      future: electricityElectricityPrice('山西省晋中市寿阳县'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = jsonDecode(jsonEncode(snapshot.data));
          if (data['code'] != 0 || data['data'].toString() == '[]') {
            showContent = Text(
              data['data'].toString() == '[]'?'暂无数据':data['msg'],
              style: TextStyle(fontWeight: FontWeight.w500),
            );
          } else {
            int ordinaryChange = data['data'][0]['ordinaryMoney'] - data['data'][1]['ordinaryMoney'];
            int discountChange = data['data'][0]['discountMoney'] - data['data'][1]['discountMoney'];
            String showOrdinaryChange = ordinaryChange.toString();
            String showDiscountChange = discountChange.toString();
            if (ordinaryChange > 0){
              showOrdinaryChange = '+' + ordinaryChange.toString();
            }
            if (discountChange > 0){
              showDiscountChange = '+' + discountChange.toString();
            }

            showContent = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '普通用户:${data['data'][0]['ordinaryMoney']}元/度($showOrdinaryChange)',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Text(
                  '电能取暖用户:${data['data'][0]['discountMoney']}元/度($showDiscountChange)',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            );
          }
          return SizedBox(
            height: ScreenUtil().setHeight(270),
            child: Card(
              elevation: 15.0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
              //设置圆角
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      '今日电价:',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.power,
                      color: string2Color(primaryColor),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: showContent,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text('加载中'),
          );
        }
      },
    );
  }
}
