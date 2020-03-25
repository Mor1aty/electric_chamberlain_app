import 'package:electric_chamberlain_app/pages/me/me_nickname_page.dart';
import 'package:flutter/material.dart';
import '../../model/user_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/util.dart';

class MeUserPage extends StatelessWidget {
  final UserInfo userInfo;

  MeUserPage({Key key, @required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人信息')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              trailing: Image.asset(
                userInfo.portrait.fileLocation,
                height: ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(200),
              ),
              title: Text('头像'),
              onTap: () {
                toast('修改头像');
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Divider(height: 1.0, color: Colors.grey),
            ListTile(
              trailing: Text(userInfo.nickname),
              title: Text('昵称'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MeNicknamePage(userInfo: userInfo)),
                );
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Divider(height: 1.0, color: Colors.grey),
            ListTile(
              trailing: Text(userInfo.phone),
              title: Text('手机号'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Divider(height: 1.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
