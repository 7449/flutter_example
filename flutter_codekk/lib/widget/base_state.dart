import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/widget/status_widget.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ListState<T extends StatefulWidget, ENTITY> extends State<T> {
  final GlobalKey<RefreshIndicatorState> globalKey =
      new GlobalKey<RefreshIndicatorState>();
  final ScrollController scrollController = new ScrollController();
  List<ENTITY> list = [];
  bool isLoadMore = false;
  int page = 1;
  Status status = Status.SUCCESS;

  @override
  void initState() {
    super.initState();
    onRefresh(); // currentState null at this time, so the app crashes.
  }

  @override
  Widget build(BuildContext context) {
    return new StatusWidget(
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
    );
  }

  Future<Null> onRefresh();

  void onLoadMore();

  Widget itemWidget(ENTITY entity);

  void refreshSuccess(List<ENTITY> item) {
    list = [];
    list.addAll(item);
    list.isEmpty ? status = Status.EMPTY : page = 2;
    isLoadMore = false;
    updateState();
  }

  void refreshError() {
    list = [];
    status = Status.ERROR;
    isLoadMore = false;
    updateState();
  }

  void loadMoreSuccess(List<ENTITY> item) {
    if (item.isEmpty) {
      noMoreTips();
    } else {
      list.addAll(item);
      page++;
    }
    isLoadMore = false;
    updateState();
  }

  void loadMoreError() {
    loadMoreErrorTips();
    isLoadMore = false;
    updateState();
  }

  bool onNotification(ScrollNotification notification) {
    if (scrollController.position.maxScrollExtent == scrollController.offset &&
        page != 1 &&
        !isLoadMore) {
      setState(() => isLoadMore = true);
      onLoadMore();
    }
    return true;
  }

  void updateState() {
    setState(() {});
  }

  void retry() {
    isLoadMore = false;
    status = Status.SUCCESS;
    onRefresh();
    updateState();
  }

  launcherUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void loadMoreTips() => Scaffold
      .of(context)
      .showSnackBar(const SnackBar(content: const Text('LoadMore')));

  void noMoreTips() => Scaffold
      .of(context)
      .showSnackBar(const SnackBar(content: const Text('没有更多数据')));

  void loadMoreErrorTips() => Scaffold
      .of(context)
      .showSnackBar(const SnackBar(content: const Text('网络错误')));
}
