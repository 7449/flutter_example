import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/broad_cast_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:flutter_ipanda/widget/base_state.dart';
import 'package:flutter_ipanda/widget/status_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class BroadcastScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BroadcastState();
}

class BroadcastState extends ListState<BroadcastScreen, Object> {
  @override
  Widget itemWidget(Object entity, int index) {
    if (entity is BroadcastBigImageEntity) {
      return _bigImage(entity);
    } else {
      return _list(entity);
    }
  }

  Widget _list(BroadcastChildListEntity entity) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.width / 5,
        padding: EdgeInsets.all(4.0),
        child: Row(children: <Widget>[
          Stack(alignment: AlignmentDirectional.bottomStart, children: <Widget>[
            Container(
                width: size.width / 3,
                height: size.width / 5,
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: entity.picUrl,
                    fit: BoxFit.cover)),
            Container(
                margin: EdgeInsets.all(4.0),
                child: Text(entity.videoLength,
                    style: TextStyle(color: Colors.white, fontSize: 12.0)))
          ]),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
                  child: Column(children: <Widget>[
                    Expanded(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(entity.title,
                                style: TextStyle(fontSize: 12.0)))),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                DateTime
                                    .fromMillisecondsSinceEpoch(
                                        entity.focusDate)
                                    .toString(),
                                style: TextStyle(fontSize: 10.0))))
                  ])))
        ]));
  }

  Widget _bigImage(BroadcastBigImageEntity entity) {
    return Stack(alignment: Alignment.bottomLeft, children: <Widget>[
      FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: entity.image,
          fit: BoxFit.cover),
      Text(entity.title, style: TextStyle(color: Colors.white))
    ]);
  }

  @override
  void onLoadMore() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tabs[3])),
      body: super.build(context),
    );
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchBroadcast().then((entity) {
      fetchBroadcastList(entity.listUrl).then((listEntity) {
        list = [];
        list.addAll(entity.bigImg);
        list.addAll(listEntity.list);
        list.isEmpty ? status = Status.EMPTY : page = 2;
        isLoadMore = false;
        updateState();
      }).catchError((error) => refreshError());
    }).catchError((error) => refreshError());
  }
}
