import 'package:flutter/material.dart';
import '../../services/home_service.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/color.dart';
import '../../utils/util.dart';

class AdBanner extends StatefulWidget {
  @override
  _AdBannerState createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  bool visible = true;
  String showText;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        child: FutureBuilder(
          future: activityRedPaper(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = jsonDecode(jsonEncode(snapshot.data));
              if (data == null) {
                showText = '请先登录';
              } else {
                showText = data['msg'];
//                showText = '你有一个待领取的红包，点击领取';
              }
              return SizedBox(
                height: ScreenUtil().setHeight(250),
                child: Card(
                  elevation: 15.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  //设置圆角
                  child: new Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          '每日福利',
                          style: new TextStyle(fontWeight: FontWeight.w500),
                        ),
                        leading: Icon(
                          Icons.info_outline,
                          color: string2Color(primaryColor),
                        ),
                        trailing: FlatButton(
                          child: Text('关闭'),
                          onPressed: () {
                            setState(() {
                              visible = false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          showText,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
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
        ));
  }
}
