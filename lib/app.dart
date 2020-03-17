import 'pages/home/home_page.dart';
import 'pages/me/me_page.dart';
import 'pages/news/news_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // 当前索引页
  var _currentIndex = 0;
  HomePage homePage;
  MePage mePage;
  NewsPage newsPage;

  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (homePage == null) {
          homePage = HomePage();
        }
        return homePage;
      case 1:
        if (newsPage == null) {
          newsPage = NewsPage();
        }
        return newsPage;
      case 2:
        if (mePage == null) {
          mePage = MePage();
        }
        return mePage;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        // 通过 fixedColor 设置选中 item 的颜色
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('新闻'),
            icon: Icon(Icons.fiber_new),
          ),
          BottomNavigationBarItem(
            title: Text('我'),
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }
}
