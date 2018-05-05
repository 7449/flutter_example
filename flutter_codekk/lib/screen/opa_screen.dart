import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/opa_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:meta/meta.dart';

/// 源码解析
class OpaScreen extends StatefulWidget {
  final String title;

  OpaScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => new OpaState(title: title);
}

class OpaState extends ListState<OpaScreen, SummaryArrayEntity> {
  final String title;

  OpaState({@required this.title});

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
          text(entity.projectUrl, Colors.pinkAccent),
        ],
      ),
    ));
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
