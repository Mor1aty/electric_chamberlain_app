import 'pages/home/home_page.dart';
import 'pages/me/me_page.dart';
import 'pages/news/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.news), title: Text('新闻')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('我')),
  ];

  final List tabBodies = [HomePage(), NewsPage(), MePage()];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 初始化设计尺寸
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        // 通过 fixedColor 设置选中 item 的颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: ((index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        }),
      ),
    );
  }
}
