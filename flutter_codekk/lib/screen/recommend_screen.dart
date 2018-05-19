import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/recommend_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';

/// 今日推荐
class RecommendScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecommendState();
}

class RecommendState extends ListState<RecommendScreen, RecommendArrayEntity> {
  @override
  Widget itemWidget(RecommendArrayEntity entity) {
    return Card(
        child: InkWell(
      onTap: () => startDetailScreen(
          context, entity.title, ApiType.RECOMMEND, entity.url),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.title, Colors.blue),
          text(entity.desc, Colors.black87),
        ],
      ),
    ));
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchRecommend(1)
        .then((recommendEntity) =>
            refreshSuccess(recommendEntity.data.recommendArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchRecommend(page)
        .then((recommendEntity) =>
            loadMoreSuccess(recommendEntity.data.recommendArray))
        .catchError((error) => loadMoreError());
  }
}
