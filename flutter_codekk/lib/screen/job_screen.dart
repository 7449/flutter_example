import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/job_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:meta/meta.dart';

/// 内推
class JobScreen extends StatefulWidget {
  final String title;

  JobScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => new JobState(title: title);
}

class JobState extends ListState<JobScreen, SummaryArrayEntity> {
  final String title;

  JobState({@required this.title});

  @override
  void initState() {
    super.initState();
    onRefresh(); // currentState null at this time, so the app crashes.
  }

  @override
  Widget itemWidget(SummaryArrayEntity entity) {
    return new Card(
        child: new InkWell(
      onTap: () =>
          startDetailScreen(context, entity.authorName, ApiType.JOB, entity.id),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(children: <Widget>[
            text(entity.authorName, Colors.blue),
            text('地点:${entity.authorCity}', Colors.green),
          ]),
          text('截至时间${entity.expiredTime}', Colors.pinkAccent),
          text(entity.summary, Colors.black87),
        ],
      ),
    ));
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    await fetchJob(1).then((jobEntity) {
      list = jobEntity.data.summaryArray;
    });
    setState(() => page = 2);
  }

  @override
  void onLoadMore() async {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('LoadMore')));
    List<SummaryArrayEntity> items;
    await fetchJob(page).then((jobEntity) {
      items = jobEntity.data.summaryArray;
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
