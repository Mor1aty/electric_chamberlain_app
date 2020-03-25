import 'package:flutter/material.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsPage> {

  List<Map<String, String>> list = [
    {
      'title': '新闻1',
      'content': '这是第一条新闻',
      'author': '电能小管家',
      'imageUrl': 'assets/images/news/news_demo.png'
    },
    {
      'title': '新闻2',
      'content': '这是第二条新闻',
      'author': '电能小管家',
      'imageUrl': 'assets/images/news/news_demo.png',
    },
    {
      'title': '新闻3',
      'content': '这是第三条新闻',
      'author': '电能小管家',
      'imageUrl': 'assets/images/news/news_demo.png',
    },
    {
      'title': '新闻4',
      'content': '这是第四条新闻',
      'author': '电能小管家',
      'imageUrl': 'assets/images/news/news_demo.png',
    },
    {
      'title': '新闻5',
      'content': '这是第五条新闻',
      'author': '电能小管家',
      'imageUrl': 'assets/images/news/news_demo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻'),
        centerTitle: true,
      ),
      body: ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0, color: Colors.grey),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, String> item = list[index];

        return ListTile(
          title: Text(item['title']),
          subtitle: Text(item['content']),
          leading: Icon(Icons.fiber_new),
          trailing: Icon(Icons.arrow_forward),
          contentPadding: EdgeInsets.all(10.0),
          enabled: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetailPage(item: item)),
            );
          },
        );
      },
    ),);
  }

}
