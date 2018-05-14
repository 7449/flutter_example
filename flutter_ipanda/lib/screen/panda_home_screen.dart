import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PandaHomeScreen extends StatelessWidget {
  final String url;

  PandaHomeScreen({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home\n$url')),
    );
  }
}
