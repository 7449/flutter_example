import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// 内推
class JobScreen extends StatelessWidget {
  final String title;

  JobScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(child: new Text(title)),
    );
  }
}
