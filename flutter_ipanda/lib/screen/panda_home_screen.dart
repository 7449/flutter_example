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
        itemCount: 6,
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
              return pandaLiveItem(context, entity.pandaLive);
            case 3:
              return pandaCctvItem(context, entity.cctv);
            case 4:
              return pandaListItem(context, entity.list[0]);
            case 5:
              return pandaChinaLiveItem(context, entity.chinaLive);
          }
        });
  }

  Widget pandaChinaLiveItem(BuildContext context, ChinaLiveEntity entity) {
    Size size = MediaQuery.of(context).size;
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
            childAspectRatio: 0.8,
            physics: NeverScrollableScrollPhysics(),
            children: entity.list
                .map((entity) => InkWell(
                    onTap: () {},
                    child: Column(children: <Widget>[
                      Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Container(
//                                width: size.width / 3,
                                height: size.width / 3,
                                child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: entity.image,
                                    fit: BoxFit.cover)),
                            Text('live', style: TextStyle(color: Colors.white))
                          ]),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(entity.title,
                                  style: TextStyle(fontSize: 12.0))))
                    ])))
                .toList(),
          )
        ]));
  }

  Widget pandaListItem(BuildContext context, ListEntity entity) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<PandaVideoEntity>(
      future: fetchPandaVideo(entity.listUrl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PandaVideoListEntity> listEntity = snapshot.data.list;
          return Container(
              margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
              color: Colors.white,
              child: Column(children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(10.0),
                    child: Text(entity.title,
                        style: TextStyle(color: Colors.blue))),
                Divider(height: 2.0, color: Colors.black26),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 5.4,
                  physics: NeverScrollableScrollPhysics(),
                  children: listEntity
                      .map((entity) => Row(children: <Widget>[
                            Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: <Widget>[
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
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0)))
                                ]),
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: 6.0, left: 10.0, right: 10.0),
                                    child: Column(children: <Widget>[
                                      Expanded(
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(entity.title,
                                                  style: TextStyle(
                                                      fontSize: 12.0)))),
                                      Expanded(
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(entity.daytime,
                                                  style: TextStyle(
                                                      fontSize: 10.0))))
                                    ])))
                          ]))
                      .toList(),
                )
              ]));
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot
              .error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget pandaCctvItem(BuildContext context, CctvEntity entity) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<WonderfulEntity>(
      future: fetchWonderful(entity.listUrl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CctvListEntity> listEntity = snapshot.data.list;
          return Container(
              margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
              color: Colors.white,
              child: Column(children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(10.0),
                    child: Text(entity.title,
                        style: TextStyle(color: Colors.blue))),
                Divider(height: 2.0, color: Colors.black26),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.7,
                  physics: NeverScrollableScrollPhysics(),
                  children: listEntity
                      .map((entity) => Column(children: <Widget>[
                            Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: <Widget>[
                                  Container(
                                      height: size.width / 2,
                                      child: FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image: entity.image,
                                          fit: BoxFit.cover)),
                                  Text(entity.videoLength,
                                      style: TextStyle(color: Colors.white))
                                ]),
                            Expanded(
                                child: Column(children: <Widget>[
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(entity.title,
                                          style: TextStyle(fontSize: 12.0)))),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(entity.daytime,
                                          style: TextStyle(fontSize: 10.0))))
                            ]))
                          ]))
                      .toList(),
                )
              ]));
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot
              .error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget pandaLiveItem(BuildContext context, PandaLiveEntity entity) {
    Size size = MediaQuery.of(context).size;
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
            childAspectRatio: 0.8,
            physics: NeverScrollableScrollPhysics(),
            children: entity.list
                .map((entity) => Container(
                    height: size.width / 3,
                    child: Column(children: <Widget>[
                      Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Container(
                                height: (size.width / 3) - 20.0,
                                child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: entity.image,
                                    fit: BoxFit.cover)),
                            Text('live', style: TextStyle(color: Colors.white))
                          ]),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text(entity.title,
                                      style: TextStyle(fontSize: 12.0)))))
                    ])))
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
