import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

///  开源项目
class OpScreen extends StatelessWidget {
  final String title;

  OpScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(child: new Text(title)),
    );
  }
}
