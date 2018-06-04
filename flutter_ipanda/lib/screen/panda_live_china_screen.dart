import 'package:flutter/material.dart';
import 'package:flutter_ipanda/value.dart';

class PandaLiveChinaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[4]),
      ),
      body: Center(child: Text('LiveChina')),
    );
  }
}
