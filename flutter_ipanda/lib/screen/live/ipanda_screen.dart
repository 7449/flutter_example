import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/panda_live_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/widget/base_state.dart';
import 'package:flutter_ipanda/widget/status_widget.dart';
import 'package:flutter_ipanda/widget/widget_grid_item.dart';
import 'package:flutter_tab_widget/flutter_tab_widget.dart';
import 'package:transparent_image/transparent_image.dart';

final List<TabEntity> tabEntity = [
  new TabEntity(title: '多视角直播'),
  new TabEntity(title: '边看边聊'),
];

class LivePandaScreen extends StatefulWidget {
  final String url;

  LivePandaScreen({@required this.url});

  @override
  State<StatefulWidget> createState() => LivePandaState();
}

class LivePandaState extends State<LivePandaScreen> {
  bool showBrief = false;
  PandaLivePandaEntity entity;

  Status status = Status.LOADING;

  @override
  void initState() {
    super.initState();
    http();
  }

  http() {
    fetchPandaLives(widget.url).then((entity) {
      this.entity = entity;
      status = Status.SUCCESS;
      setState(() {});
    }).catchError((error) {
      status = Status.ERROR;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StatusWidget(
      child: _build(context, entity),
      status: status,
      onErrorPressed: () => http(),
      onEmptyPressed: () => http(),
    ));
  }

  Widget _build(BuildContext context, PandaLivePandaEntity entity) {
    if (entity == null) return Container();
    Size size = MediaQuery.of(context).size;
    PandaLiveHeaderEntity headerEntity = entity.live[0];
    return Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: headerEntity.image,
                  height: 200.0,
                  width: size.width,
                  fit: BoxFit.cover),
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.play_arrow,
                    size: 60.0,
                    color: Colors.white,
                  ))
            ],
          ),
          Padding(
            child: Text('[正在直播]${headerEntity.title}',
                style: TextStyle(fontSize: 16.0)),
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          ),
          Padding(
            child: Row(children: <Widget>[
              Text('简介:', style: TextStyle(fontSize: 16.0, color: Colors.grey)),
              IconButton(
                onPressed: () {
                  showBrief = !showBrief;
                  setState(() {});
                },
                icon: Icon(
                    !showBrief ? Icons.arrow_drop_down : Icons.arrow_drop_up),
                color: Colors.grey,
              )
            ]),
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          Divider(height: 2.0, color: Colors.black26),
          showBrief
              ? Column(children: <Widget>[
                  Padding(
                    child: Text(headerEntity.brief,
                        style: TextStyle(fontSize: 16.0)),
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  ),
                  Divider(height: 2.0, color: Colors.black26),
                ])
              : Container(),
          Expanded(
              child: TabWidget(
            entity: tabEntity,
            tabColor: Colors.white,
            tabTextSelectColor: Colors.blue,
            tabTextUnSelectColor: Colors.black,
            children: <Widget>[
              multipleWidget(context, entity.bookmark.multiple[0].url),
              WatchTalkScreen(),
            ],
          )),
        ]));
  }

  Widget multipleWidget(BuildContext context, String url) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<PandaMultipleEntity>(
      future: fetchPandaLiveMultiple(url),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            padding: EdgeInsets.all(5.0),
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.8,
            children: snapshot.data.list
                .map((entity) => GridItem(
                      title: entity.title,
                      image: entity.image,
                      imageTitle: "live",
                      imageHeight: size.width / 3,
                    ))
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class WatchTalkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WatchTalkState();
}

class WatchTalkState
    extends ListState<WatchTalkScreen, PandaWatchTalkChildEntity> {
  String url;

  @override
  Widget itemWidget(PandaWatchTalkChildEntity entity, int index) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              child: Text(entity.author),
              padding: EdgeInsets.only(bottom: 6.0),
            ),
            Padding(
              child: Text(entity.message),
              padding: EdgeInsets.only(left: 20.0),
            ),
          ]),
    );
  }

  @override
  void onLoadMore() {
    loadMoreTips();
    fetchPandaLiveWatchTalk(page).then((listEntity) {
      if (listEntity.content.isEmpty) {
        noMoreTips();
      } else {
        list.addAll(listEntity.content);
        page++;
      }
      isLoadMore = false;
      updateState();
    }).catchError((error) => loadMoreErrorTips());
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchPandaLiveWatchTalk(1).then((listEntity) {
      list = [];
      page = 1;
      list.addAll(listEntity.content);
      list.isEmpty ? status = Status.EMPTY : page = 2;
      isLoadMore = false;
      updateState();
    }).catchError((error) => refreshError());
  }
}
