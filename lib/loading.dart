import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/loading.jpg',
            height: mediaSize.height,
            width: mediaSize.width,
            fit: BoxFit.fill
          ),
          Container(
            width: mediaSize.width,
            padding: EdgeInsets.only(top: mediaSize.height / 3),
            child: Text(
              '电能管家',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
