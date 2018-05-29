import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/blog_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/screen/setting_screen.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 博客
class BlogScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BlogState();
}

class BlogState extends ListState<BlogScreen, SummaryArrayEntity> {
  bool showBlogTag = true;

  getTag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showBlogTag = prefs.getBool(blogTag) ?? true;
    setState(() {});
  }

  @override
  Widget itemWidget(SummaryArrayEntity entity) {
    return Card(
        child: InkWell(
      onTap: () =>
          startDetailScreen(context, entity.title, ApiType.BLOG, entity.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.title, Colors.blue),
          text(entity.summary, Colors.green),
          showBlogTag
              ? Wrap(
                  children: entity.tags == null
                      ? [Container()]
                      : entity.tagList.map<Widget>((entity) {
                          return Padding(
                              padding: EdgeInsets.all(4.0),
                              child: GestureDetector(
                                  onTap: () => startSearchScreen(
                                      context, entity, ApiType.OP),
                                  child: Chip(
                                      label: Text(entity),
                                      padding: EdgeInsets.all(2.0))));
                        }).toList(),
                )
              : Container()
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    getTag();
    return super.build(context);
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchBlog(1)
        .then((blogEntity) => refreshSuccess(blogEntity.summaryArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchBlog(page)
        .then((blogEntity) => loadMoreSuccess(blogEntity.summaryArray))
        .catchError((error) => loadMoreError());
  }
}
