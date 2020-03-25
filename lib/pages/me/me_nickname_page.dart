import 'package:electric_chamberlain_app/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/util.dart';
import '../../style/color.dart';
import '../../services/me_service.dart';

class MeNicknamePage extends StatefulWidget {
  final UserInfo userInfo;

  MeNicknamePage({Key key, this.userInfo}) : super(key: key);

  @override
  _MeNicknamePageState createState() => _MeNicknamePageState();
}

class _MeNicknamePageState extends State<MeNicknamePage> {
  TextEditingController nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = this.widget.userInfo;
    nicknameController.text = userInfo.nickname;
    return Scaffold(
      appBar: AppBar(title: Text('更改昵称')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: nicknameController,
              decoration: InputDecoration(
                labelText: '昵称',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_circle),
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          RaisedButton(
            color: string2Color(primaryColor),
            textColor: Colors.white,
            child: Text(
              '保存',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
            onPressed: () {
              if (userInfo.nickname == nicknameController.text) {
                return;
              }
              userNickname(nicknameController.text).then((val) {
                userInfo.nickname = nicknameController.text;
                saveUserInfo(userInfo);
                Navigator.of(context)..pop()..pop();
              });
            },
          ),
        ],
      ),
    );
  }
}
