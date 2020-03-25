import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailPage extends StatelessWidget {
  final Map<String, String> item;

  NewsDetailPage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['title'])),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('作者:${item['author']}'),
        ),
          Image.asset(
            item['imageUrl'],
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(333),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(item['content']),
          ),
        ],
      ),
    );
  }
}
