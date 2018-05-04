import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/widget/status_widget.dart';

abstract class ListState<T extends StatefulWidget, ENTITY> extends State<T> {
  final GlobalKey<RefreshIndicatorState> globalKey =
      new GlobalKey<RefreshIndicatorState>();
  final ScrollController scrollController = new ScrollController();
  List<ENTITY> list = [];
  bool isLoadMore = false;
  int page = 1;
  Status status = Status.SUCCESS;

  bool onNotification(ScrollNotification notification) {
    if (scrollController.position.maxScrollExtent == scrollController.offset &&
        page != 1 &&
        !isLoadMore) {
      setState(() => isLoadMore = true);
      onLoadMore();
    }
    return true;
  }

  Future<Null> onRefresh();

  void onLoadMore();

  Widget itemWidget(ENTITY entity);

  void loadMoreTips() => Scaffold
      .of(context)
      .showSnackBar(new SnackBar(content: new Text('LoadMore')));

  void noMoreTips() => Scaffold
      .of(context)
      .showSnackBar(new SnackBar(content: new Text('没有更多数据')));

  void loadMoreErrorTips() => Scaffold
      .of(context)
      .showSnackBar(new SnackBar(content: new Text('网络错误')));
}
