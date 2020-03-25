import 'package:flutter/material.dart';
import 'home_banner_page.dart';
import 'home_ad_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_elecprice_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          HomeBannerWidget(),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          AdBanner(),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          HomeElecPriceWidget(),
        ],
      ),
    );
  }


}
