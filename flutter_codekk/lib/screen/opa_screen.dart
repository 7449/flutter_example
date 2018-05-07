import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/opa_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/screen/setting_screen.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 源码解析
class OpaScreen extends StatefulWidget {
  final String title;

  OpaScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => new OpaState(title: title);
}

class OpaState extends ListState<OpaScreen, SummaryArrayEntity> {
  final String title;
  bool showOpaTag;

  OpaState({@required this.title});

  getTag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showOpaTag = prefs.getBool(opaTag);
    setState(() {});
  }

  @override
  Widget itemWidget(SummaryArrayEntity entity) {
    return new Card(
        child: new InkWell(
      onTap: () =>
          startDetailScreen(context, entity.title, ApiType.OPA, entity.id),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.title, Colors.blue),
          text(entity.summary, Colors.green),
          new GestureDetector(
              onTap: () => launcherUrl(entity.projectUrl),
              child: text(entity.projectUrl, Colors.pinkAccent)),
          showOpaTag
              ? new Wrap(
                  children: entity.tags == null
                      ? [new Container()]
                      : entity.tagList.map<Widget>((entity) {
                          return new Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: new GestureDetector(
                                  onTap: () => startSearchScreen(
                                      context, entity, ApiType.OP),
                                  child: new Chip(
                                      label: new Text(entity),
                                      padding: const EdgeInsets.all(2.0))));
                        }).toList(),
                )
              : new Container()
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    getTag();
    return super.build(context);
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchOpa(1)
        .then((opaEntity) => refreshSuccess(opaEntity.data.summaryArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchOpa(page)
        .then((opaEntity) => loadMoreSuccess(opaEntity.data.summaryArray))
        .catchError((error) => loadMoreError());
  }
}
