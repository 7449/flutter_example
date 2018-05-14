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
  State<StatefulWidget> createState() => JobState(title: title);
}

class JobState extends ListState<JobScreen, SummaryArrayEntity> {
  final String title;

  JobState({@required this.title});

  @override
  Widget itemWidget(SummaryArrayEntity entity) {
    return Card(
        child: InkWell(
      onTap: () =>
          startDetailScreen(context, entity.authorName, ApiType.JOB, entity.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
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
    fetchJob(1)
        .then((jobEntity) => refreshSuccess(jobEntity.data.summaryArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchJob(page)
        .then((jobEntity) => loadMoreSuccess(jobEntity.data.summaryArray))
        .catchError((error) => loadMoreError());
  }
}
