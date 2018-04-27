import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// 今日推荐
class RecommendScreen extends StatelessWidget {
  final String title;

  RecommendScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(child: new Text(title)),
    );
  }
}
