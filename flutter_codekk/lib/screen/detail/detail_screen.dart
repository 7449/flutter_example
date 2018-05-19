import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/readme_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:meta/meta.dart';

/// 内容详情
class ReadmeScreen extends StatefulWidget {
  final String title;
  final String id;
  final ApiType apiType;

  ReadmeScreen(
      {@required this.title, @required this.apiType, @required this.id});

  @override
  State<StatefulWidget> createState() => ReadmeState();
}

class ReadmeState extends State<ReadmeScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.apiType == ApiType.RECOMMEND) {
      return WebviewScaffold(
          appBar: AppBar(title: Text(widget.title)), url: widget.id);
    }
    return FutureBuilder<ReadmeEntity>(
      future: fetchReadme(widget.apiType, widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WebviewScaffold(
              appBar: AppBar(title: Text(widget.title)),
              url: Uri
                  .dataFromString(snapshot.data.data.content,
                      mimeType: 'text/html', encoding: utf8)
                  .toString());
        } else if (snapshot.hasError) {
          return Scaffold(
              appBar: AppBar(title: Text(widget.title)),
              body: Center(child: Text(snapshot.error)));
        }
        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
