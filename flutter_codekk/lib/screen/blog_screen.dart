import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/blog_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:meta/meta.dart';

/// 博客
class BlogScreen extends StatefulWidget {
  final String title;

  BlogScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => new BlogState(title: title);
}

class BlogState extends ListState<BlogScreen, SummaryArrayEntity> {
  final String title;

  BlogState({@required this.title});

  @override
  void initState() {
    super.initState();
    onRefresh(); // currentState null at this time, so the app crashes.
  }

  @override
  Widget itemWidget(SummaryArrayEntity entity) {
    return new Card(
        child: new InkWell(
      onTap: () => startDetailScreen(context, entity.title, ApiType.BLOG),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.title, Colors.blue),
          text(entity.summary, Colors.green),
        ],
      ),
    ));
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    await fetchBlog(1).then((blogEntity) {
      list = blogEntity.data.summaryArray;
    });
    setState(() => page = 2);
  }

  @override
  void onLoadMore() async {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('LoadMore')));
    List<SummaryArrayEntity> items;
    await fetchBlog(page).then((blogEntity) {
      items = blogEntity.data.summaryArray;
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
