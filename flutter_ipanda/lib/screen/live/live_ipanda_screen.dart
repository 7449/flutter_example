import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/tab_panda_live_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/widget/status_widget.dart';
import 'package:transparent_image/transparent_image.dart';

/// 直播
class LivePandaScreen extends StatefulWidget {
  final String url;

  LivePandaScreen({@required this.url});

  @override
  State<StatefulWidget> createState() => LivePandaState();
}

class LivePandaState extends State<LivePandaScreen> {
  bool showBrief = false;

  LivePandaEntity entity;

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
//    return Center(
//      child: FutureBuilder<LivePandaEntity>(
//        future: fetchPandaLives(widget.url),
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            return _build(context, snapshot.data);
//          } else if (snapshot.hasError) {
//            return Text('${snapshot.error}');
//          }
//          return CircularProgressIndicator();
//        },
//      ),
////      child: Container(height: 200.0, child: VideoPlayer(controller)),
////      floatingActionButton: FloatingActionButton(
////        onPressed:
////            controller.value.isPlaying ? controller.pause : controller.play,
////        child: Icon(
////          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
////        ),
////      ),
//    );
  }

  Widget _build(BuildContext context, LivePandaEntity entity) {
    if (entity == null) return Container();
    Size size = MediaQuery.of(context).size;
    LiveHeaderEntity headerEntity = entity.live[0];
    return Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: headerEntity.image,
              height: 200.0,
              width: size.width,
              fit: BoxFit.cover),
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
          Row(children: <Widget>[]),
        ]));
  }
}
