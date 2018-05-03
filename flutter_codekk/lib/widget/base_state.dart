import 'dart:async';

import 'package:flutter/material.dart';

abstract class ListState<T extends StatefulWidget, ENTITY> extends State<T> {
  final GlobalKey<RefreshIndicatorState> globalKey =
      new GlobalKey<RefreshIndicatorState>();
  final ScrollController scrollController = new ScrollController();
  List<ENTITY> list = [];
  bool isLoadMore = false;
  int page = 1;

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
}
