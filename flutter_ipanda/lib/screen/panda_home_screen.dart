import 'package:flutter/material.dart';
import 'package:flutter_banner_widget/banner/banner_widget.dart';
import 'package:flutter_ipanda/entity/tab_home_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:transparent_image/transparent_image.dart';

class PandaHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TabHomeEntity>(
      future: fetchHome(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _build(context, snapshot);
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _build(context, snapshot) {
    TabDataEntity entity = snapshot.data.data;
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return BannerWidget(
                height: 215,
                entity: entity.banner,
                bannerPress: (position, entity) {},
              );
            case 1:
              return pandaEyeItem(entity.pandaEye);
            case 2:
              return pandaLiveItem(entity.pandaLive);
          }
        });
  }

  Widget pandaLiveItem(PandaLiveEntity entity) {
    return Container(
        margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
        color: Colors.white,
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(10.0),
              child: Text(entity.title, style: TextStyle(color: Colors.blue))),
          Divider(height: 2.0, color: Colors.black26),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 1.2,
            padding: EdgeInsets.all(2.0),
            children: entity.list
                .map((entity) => Column(children: <Widget>[
                      Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: entity.image),
                            Text('live', style: TextStyle(color: Colors.white))
                          ]),
                      Expanded(
                          child: Text(entity.title,
                              style: TextStyle(fontSize: 12.0)))
                    ]))
                .toList(),
          )
        ]));
  }

  Widget pandaEyeItem(PandaEyeEntity entity) {
    return Container(
        margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
        color: Colors.white,
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(10.0),
              child: Text(entity.title, style: TextStyle(color: Colors.blue))),
          Divider(height: 2.0, color: Colors.black26),
          Row(children: <Widget>[
            FadeInImage.memoryNetwork(
                width: 100.0,
                height: 100.0,
                placeholder: kTransparentImage,
                image: entity.log),
            Expanded(
                child: Column(
                    children: entity.items
                        .map((entity) => Container(
                            margin: EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 2.0,
                                          bottom: 2.0),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.pink)),
                                      child: Text(entity.brief,
                                          style:
                                              TextStyle(color: Colors.pink))),
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                              top: 2.0,
                                              bottom: 2.0),
                                          child: Text(entity.title,
                                              style:
                                                  TextStyle(fontSize: 12.0))))
                                ])
                              ],
                            )))
                        .toList())),
          ])
        ]));
  }
}
