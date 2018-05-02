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
  final String title;
  List<ProjectArrayEntity> list = [];
  final GlobalKey<RefreshIndicatorState> globalKey =
      new GlobalKey<RefreshIndicatorState>();

  OpState({@required this.title});

  @override
  void initState() {
    super.initState();
    refresh(); // currentState null at this time, so the app crashes.
  }

  Widget listItem(context, index, ProjectArrayEntity info) {
    return new Card(
        child: new InkWell(
      onTap: () {},
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text('${info.projectName}',
                style: new TextStyle(color: Colors.green)),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text('${info.desc}',
                style: new TextStyle(color: Colors.blue)),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text('${info.projectUrl}',
                style: new TextStyle(color: Colors.pinkAccent)),
          ),
        ],
      ),
    ));
  }

  Future refresh() async {
    globalKey.currentState?.show();
    List<ProjectArrayEntity> items;
    await fetchOp(1, '').then((opEntity) {
      items = opEntity.data.projectArray;
    });
    setState(() => list = items);
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RefreshIndicator(
        key: globalKey,
        onRefresh: refresh,
        child: new ListView.builder(
          padding: kMaterialListPadding,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) =>
              listItem(context, index, list[index]),
        ),
      ),
    );
  }
}
