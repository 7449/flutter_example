import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/recommend_search_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:flutter_codekk/widget/status_widget.dart';
import 'package:meta/meta.dart';

///  搜索今日推荐
class RecommendSearchScreen extends StatefulWidget {
  final String search;

  RecommendSearchScreen({@required this.search});

  @override
  State<StatefulWidget> createState() => RecommendSearchState(search: search);
}

class RecommendSearchState
    extends ListState<RecommendSearchScreen, RecommendArrayEntity> {
  final String search;

  RecommendSearchState({@required this.search});

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
    fetchRecommendSearch(search, 1)
        .then((recommendEntity) =>
            refreshSuccess(recommendEntity.data.recommendArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchRecommendSearch(search, page)
        .then((recommendEntity) =>
            loadMoreSuccess(recommendEntity.data.recommendArray))
        .catchError((error) => loadMoreError());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(search)),
      body: StatusWidget(
        child: NotificationListener(
          onNotification: onNotification,
          child: RefreshIndicator(
            key: globalKey,
            onRefresh: onRefresh,
            child: ListView.builder(
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
