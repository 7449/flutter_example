import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/readme_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:meta/meta.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// 内容详情
class ReadmeScreen extends StatefulWidget {
  final String title;
  final String id;
  final ApiType apiType;

  ReadmeScreen(
      {@required this.title, @required this.apiType, @required this.id});

  @override
  State<StatefulWidget> createState() =>
      new ReadmeState(title: title, apiType: apiType, id: id);
}

class ReadmeState extends State<ReadmeScreen> {
  final String title;
  final String id;
  final ApiType apiType;

  ReadmeState(
      {@required this.title, @required this.apiType, @required this.id});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (apiType == ApiType.RECOMMEND) {
      return new WebviewScaffold(
          appBar: new AppBar(title: new Text(title)), url: id);
    }
    return new FutureBuilder<ReadmeEntity>(
      future: fetchReadme(apiType, id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new WebviewScaffold(
              appBar: new AppBar(title: new Text(title)),
              url: new Uri.dataFromString(snapshot.data.data.content,
                      mimeType: 'text/html', encoding: utf8)
                  .toString());
        } else if (snapshot.hasError) {
          return new Scaffold(
              appBar: new AppBar(title: new Text(title)),
              body: new Center(child: new Text(snapshot.error)));
        }
        return new Scaffold(
          appBar: new AppBar(title: new Text(title)),
          body: new Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
