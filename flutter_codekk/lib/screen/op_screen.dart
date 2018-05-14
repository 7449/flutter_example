import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/screen/setting_screen.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

///  开源项目
class OpScreen extends StatefulWidget {
  final String title;

  OpScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => OpState(title: title);
}

class OpState extends ListState<OpScreen, ProjectArrayEntity> {
  final String title;
  bool showOpTag = true;

  OpState({@required this.title});

  getTag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showOpTag = prefs.getBool(opTag) ?? true;
    setState(() {});
  }

  @override
  Widget itemWidget(ProjectArrayEntity entity) {
    return Card(
        child: InkWell(
      onTap: () =>
          startDetailScreen(context, entity.projectName, ApiType.OP, entity.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.projectName, Colors.green),
          text(entity.desc, Colors.blue),
          GestureDetector(
              onTap: () => launcherUrl(entity.projectUrl),
              child: text(entity.projectUrl, Colors.pinkAccent)),
          showOpTag
              ? Wrap(
                  children: entity.tags == null
                      ? [Container()]
                      : entity.tags.map<Widget>((entity) {
                          return Padding(
                              padding: EdgeInsets.all(4.0),
                              child: GestureDetector(
                                  onTap: () => startSearchScreen(
                                      context, entity.name, ApiType.OP),
                                  child: Chip(
                                      label: Text(entity.name),
                                      padding: EdgeInsets.all(2.0))));
                        }).toList(),
                )
              : Container()
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
    fetchOp(1, '')
        .then((opEntity) => refreshSuccess(opEntity.data.projectArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchOp(page, '')
        .then((opEntity) => loadMoreSuccess(opEntity.data.projectArray))
        .catchError((error) => loadMoreError());
  }
}
