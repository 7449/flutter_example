import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PandaBroadcastScreen extends StatelessWidget {
  final String url;

  PandaBroadcastScreen({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Broadcast\n$url')),
    );
  }
}
