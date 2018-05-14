import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PandaVideoScreen extends StatelessWidget {
  final String url;

  PandaVideoScreen({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Video\n$url')),
    );
  }
}
