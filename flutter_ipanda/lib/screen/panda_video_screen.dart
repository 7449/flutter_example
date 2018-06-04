import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/tab_video_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:transparent_image/transparent_image.dart';

class PandaVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tabs[2])),
      body: FutureBuilder<BaseVideoEntity>(
        future: fetchVideoEntity(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _build(context, snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _build(BuildContext context, BaseVideoEntity entity) {
    return ListView.builder(
      itemCount: entity.list.length + entity.bigImg.length,
      itemBuilder: (context, index) {
        if (index < entity.bigImg.length) {
          return _bigImage(context, entity.bigImg[index]);
        }
        return _list(context, entity.list[index - entity.bigImg.length]);
      },
    );
  }

  Widget _list(BuildContext context, ListEntity entity) {
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
                    image: entity.image,
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
                            child: Text(entity.brief,
                                style: TextStyle(fontSize: 10.0))))
                  ])))
        ]));
  }

  Widget _bigImage(BuildContext context, BigImageEntity entity) {
    return Stack(alignment: Alignment.bottomLeft, children: <Widget>[
      FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: entity.image,
          fit: BoxFit.cover),
      Text(entity.title, style: TextStyle(color: Colors.white))
    ]);
  }
}
