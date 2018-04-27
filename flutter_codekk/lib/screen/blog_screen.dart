import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// 博客
class BlogScreen extends StatelessWidget {
  final String title;

  BlogScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(child: new Text(title)),
    );
  }
}
