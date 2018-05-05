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
  Widget itemWidget(SummaryArrayEntity entity) {
    return new Card(
        child: new InkWell(
      onTap: () =>
          startDetailScreen(context, entity.title, ApiType.BLOG, entity.id),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.title, Colors.blue),
          text(entity.summary, Colors.green),
          new Wrap(
            children: entity.tags == null
                ? [new Container()]
                : entity.tagList.map<Widget>((entity) {
                    return new Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new Chip(label: new Text(entity)));
                  }).toList(),
          )
        ],
      ),
    ));
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchBlog(1)
        .then((blogEntity) => refreshSuccess(blogEntity.data.summaryArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchBlog(page)
        .then((blogEntity) => loadMoreSuccess(blogEntity.data.summaryArray))
        .catchError((error) => loadMoreError());
  }
}
