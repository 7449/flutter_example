import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/op_search_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:flutter_codekk/widget/status_widget.dart';
import 'package:meta/meta.dart';

///  搜索开源项目
class OpSearchScreen extends StatefulWidget {
  final String search;

  OpSearchScreen({@required this.search});

  @override
  State<StatefulWidget> createState() => new OpSearchState(search: search);
}

class OpSearchState extends ListState<OpSearchScreen, ProjectArrayEntity> {
  final String search;

  OpSearchState({@required this.search});

  @override
  Widget itemWidget(ProjectArrayEntity entity) {
    return new Card(
        child: new InkWell(
      onTap: () =>
          startDetailScreen(context, entity.projectName, ApiType.OP, entity.id),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.projectName, Colors.green),
          text(entity.desc, Colors.blue),
          text(entity.projectUrl, Colors.pinkAccent),
        ],
      ),
    ));
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchOpSearch(search, 1)
        .then((opEntity) => refreshSuccess(opEntity.data.projectArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchOpSearch(search, page)
        .then((opEntity) => loadMoreSuccess(opEntity.data.projectArray))
        .catchError((error) => loadMoreError());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(search)),
      body: new StatusWidget(
        child: new NotificationListener(
          onNotification: onNotification,
          child: new RefreshIndicator(
            key: globalKey,
            onRefresh: onRefresh,
            child: new ListView.builder(
              controller: scrollController,
              padding: kMaterialListPadding,
              itemCount: list.length,
              itemBuilder: (context, index) => itemWidget(list[index]),
            ),
          ),
        ),
        status: status,
        onErrorPressed: () => retry(),
        onEmptyPressed: () => retry(),
      ),
    );
  }
}
