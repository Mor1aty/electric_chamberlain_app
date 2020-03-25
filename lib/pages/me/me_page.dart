import 'package:electric_chamberlain_app/model/user_info.dart';
import 'package:electric_chamberlain_app/pages/me/me_user_page.dart';
import 'package:flutter/material.dart';
import '../../services/me_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'me_login_page.dart';
import '../../utils/util.dart';

class MePage extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<MePage> {
  Portrait portrait;
  UserInfo userInfo;

  @override
  Widget build(BuildContext context) {

    Future<void> _askedToLoad() async {
      return showDialog<Null>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('你确定要退出吗?', style: new TextStyle(fontSize: 17.0)),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('取消'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text('确定'),
                  onPressed: (){
                    removeUserInfo();
                    setState(() {
                      userInfo = null;
                      portrait = null;
                    });
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: getUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = jsonDecode(snapshot.data);
              portrait = Portrait.fromMap(data['portrait']);
              userInfo = UserInfo.fromMap(data);
              userInfo.portrait = portrait;
              String showType;
              switch (userInfo.type) {
                case 0:
                  showType = '普通用户';
                  break;
                case 1:
                  showType = '电能取暖用户';
                  break;
                case 10:
                  showType = '普通用户（等待升级中）';
                  break;
                default:
                  showType = '未知状态用户';
              }
              return ListView(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  ListTile(
                    leading: Image.asset(
                      userInfo.portrait.fileLocation,
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(200),
                    ),
                    title: Text(userInfo.nickname),
                    subtitle: Text('手机号:' + userInfo.phone),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MeUserPage(userInfo: userInfo)));
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.attach_money),
                        title: Text('余额: ' + userInfo.money.toString()),
                      ),
                      ListTile(
                        leading: Icon(Icons.assignment_ind),
                        title: Text(showType),
                        trailing: FlatButton(
                          child: Text('升级'),
                          onPressed: () {
                            toast('升级申请');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_downward),
                        title: Text('退出登录'),
                        onTap: () {
                          _askedToLoad();
                        },
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return ListView(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/me/default.jpg',
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(200),
                    ),
                    title: Text('登录/注册'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MeLoginPage()),
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
