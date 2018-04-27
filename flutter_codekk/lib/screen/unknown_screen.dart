import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// 未知
class UnKnowScreen extends StatelessWidget {
  final String title;

  UnKnowScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(child: new Text(title)),
    );
  }
}
