import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PandaLiveScreen extends StatelessWidget {
  final String url;

  PandaLiveScreen({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Live\n$url')),
    );
  }
}
