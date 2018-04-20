import 'package:flutter/material.dart';
import 'package:zhihu_zhuan_lan/values.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: new ThemeData(
          primaryColor: Colors.cyan,
        ),
        child: new Scaffold(
            appBar: new AppBar(title: new Text(HomeTitle)),
            body: new Center(
              child: new Text(HomeTitle),
            )));
  }
}
