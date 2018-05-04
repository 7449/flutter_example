import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/recommend_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:meta/meta.dart';

/// 今日推荐
class RecommendScreen extends StatefulWidget {
  final String title;

  RecommendScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => new RecommendState(title: title);
}

class RecommendState extends ListState<RecommendScreen, RecommendArrayEntity> {
  final String title;

  RecommendState({@required this.title});

  @override
  void initState() {
    super.initState();
    onRefresh(); // currentState null at this time, so the app crashes.
  }

  @override
  Widget itemWidget(RecommendArrayEntity entity) {
    return new Card(
        child: new InkWell(
      onTap: () => startDetailScreen(
          context, entity.title, ApiType.RECOMMEND, entity.url),
      child: new Column(
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
    await fetchRecommend(1).then((recommendEntity) {
      list = recommendEntity.data.recommendArray;
    });
    setState(() => page = 2);
  }

  @override
  void onLoadMore() async {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('LoadMore')));
    List<RecommendArrayEntity> items;
    await fetchRecommend(page).then((recommendEntity) {
      items = recommendEntity.data.recommendArray;
    });
    if (items.isEmpty) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text('没有更多数据')));
    } else {
      list.addAll(items);
      page++;
      isLoadMore = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new NotificationListener(
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
    );
  }
}
