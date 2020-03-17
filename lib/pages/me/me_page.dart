import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
      ),
      body: Container(
        child: Text('我'),
      ),
    );
  }

}
