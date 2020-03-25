import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../style/color.dart';
import '../../utils/util.dart';
import '../../services/me_service.dart';
import '../../model/user_info.dart';


class MeLoginPage extends StatefulWidget {
  @override
  _MeLoginPageState createState() => _MeLoginPageState();
}

class _MeLoginPageState extends State<MeLoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController verificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginForm = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(50),
        ),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: '请输入手机号',
            labelText: '手机',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.phone),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: string2Color(primaryColor)),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text('获取验证码'),
            onPressed: () {
              toast('验证码：9527');
            }),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        TextField(
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          controller: verificationController,
          decoration: InputDecoration(
            hintText: '请输入验证码',
            labelText: '验证码',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.code),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(50),
        ),
        Container(
          width: ScreenUtil().setWidth(500),
          height: ScreenUtil().setHeight(80),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: string2Color(primaryColor)),
            ),
            child: Text('登录'),
            onPressed: () {
              if(phoneController.text.isEmpty){
                toast('请输入手机号');
                return;
              }
              if(verificationController.text.isEmpty){
                toast('请输入验证码');
                return;
              }
              userPhone(phoneController.text, int.parse(verificationController.text)).then((val){
                if (val['code'] != 0){
                  toast(val['msg']);
                  return;
                }
                var data = val['data'];
                print(data);
                UserInfo userInfo = new UserInfo();
                userInfo.phone = data['phone'];
                userInfo.nickname = data['nickname'];
                userInfo.money = int.parse(data['money'].toString());
                Portrait portrait = new Portrait();
                if(data['portrait'] != null){
                  portrait.fileLocation = data['portrait']['fileLocation'];
                  portrait.context = data['portrait']['context'];
                  userInfo.portrait = portrait;
                }
                userInfo.type = data['type'];
                userInfo.token = data['token'];
                saveUserInfo(userInfo);
                toast('登录成功');
                Navigator.pop(context);
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(50),
        ),
        Container(
          width: ScreenUtil().setWidth(500),
          height: ScreenUtil().setHeight(80),
          child: FlatButton(
            child: Text('已有账号？使用账号密码登录'),
            onPressed: () {
              toast('跳转');
            },
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: loginForm,
      ),
    );
  }
}
