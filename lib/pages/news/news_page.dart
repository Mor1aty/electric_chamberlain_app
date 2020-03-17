import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻'),
      ),
      body: Container(
        child: Text('新闻'),
      ),
    );
  }

}
