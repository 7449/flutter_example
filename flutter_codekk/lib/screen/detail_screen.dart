import 'package:flutter/material.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:meta/meta.dart';

/// 内容详情
class ReadmeScreen extends StatefulWidget {
  final String title;
  final ApiType apiType;

  ReadmeScreen({@required this.title, @required this.apiType});

  @override
  State<StatefulWidget> createState() =>
      new ReadmeState(title: title, apiType: apiType);
}

class ReadmeState extends State<ReadmeScreen> {
  final String title;
  final ApiType apiType;

  ReadmeState({@required this.title, @required this.apiType});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text(title)),
    );
  }
}
