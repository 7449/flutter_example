import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:meta/meta.dart';

///  开源项目
class OpScreen extends StatefulWidget {
  final String title;

  OpScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => new OpState(title: title);
}

class OpState extends State<OpScreen> {
  final GlobalKey<RefreshIndicatorState> globalKey =
      new GlobalKey<RefreshIndicatorState>();
  final ScrollController scrollController = new ScrollController();
  List<ProjectArrayEntity> list = [];
  final String title;
  bool isLoadMore = false;
  int page = 1;

  OpState({@required this.title});

  @override
  void initState() {
    super.initState();
    refresh(); // currentState null at this time, so the app crashes.
  }

  Widget listItem(ProjectArrayEntity info) {
    /// 这里如果想更好的体验可以判断下字段内容是否为空来显示`widget`
    return new Card(
        child: new InkWell(
      onTap: () {},
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text(info.projectName,
                style: new TextStyle(color: Colors.green)),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child:
                new Text(info.desc, style: new TextStyle(color: Colors.blue)),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text(info.projectUrl,
                style: new TextStyle(color: Colors.pinkAccent)),
          ),
        ],
      ),
    ));
  }

  Future<Null> refresh() async {
    globalKey.currentState?.show();
    List<ProjectArrayEntity> items;
    await fetchOp(1, '').then((opEntity) {
      items = opEntity.data.projectArray;
    });
    setState(() {
      list = items;
      page = 2;
    });
  }

  void loadMore() async {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('LoadMore')));
    List<ProjectArrayEntity> items;
    await fetchOp(page, '').then((opEntity) {
      items = opEntity.data.projectArray;
    });
    if (items.isEmpty) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text('没有更多数据')));
    } else {
      setState(() {
        list.addAll(items);
        page++;
        isLoadMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new NotificationListener(
      onNotification: onNotification,
      child: new RefreshIndicator(
        key: globalKey,
        onRefresh: refresh,
        child: new ListView.builder(
          controller: scrollController,
          padding: kMaterialListPadding,
          itemCount: list.length,
          itemBuilder: (context, index) => listItem(list[index]),
        ),
      ),
    );
  }

  bool onNotification(ScrollNotification notification) {
    if (scrollController.position.maxScrollExtent == scrollController.offset &&
        page != 1 &&
        !isLoadMore) {
      setState(() => isLoadMore = true);
      loadMore();
    }
    return true;
  }
}
