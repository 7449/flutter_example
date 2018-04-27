import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// 源码解析
class OpaScreen extends StatelessWidget {
  final String title;

  OpaScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(child: new Text(title)),
    );
  }
}
