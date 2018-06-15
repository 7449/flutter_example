import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/broad_cast_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:flutter_ipanda/widget/base_state.dart';
import 'package:flutter_ipanda/widget/status_widget.dart';
import 'package:flutter_ipanda/widget/widget_grid_item.dart';
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
        child: ListItem(
          image: entity.picUrl,
          imageTitle: entity.videoLength,
          title: entity.title,
          subTitle:
              DateTime.fromMillisecondsSinceEpoch(entity.focusDate).toString(),
        ));
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
