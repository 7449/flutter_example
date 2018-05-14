import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PandaLiveChinaScreen extends StatelessWidget {
  final String url;

  PandaLiveChinaScreen({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('LiveChina\n$url')),
    );
  }
}
