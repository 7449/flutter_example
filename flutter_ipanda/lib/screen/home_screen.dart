import 'package:flutter/material.dart';
import 'package:flutter_banner_widget/banner/banner_widget.dart';
import 'package:flutter_ipanda/entity/home_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:flutter_ipanda/widget/widget_grid_item.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tabs[0])),
      body: FutureBuilder<BaseHomeEntity>(
        future: fetchHome(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _build(context, snapshot);
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _build(context, snapshot) {
    HomeDataEntity entity = snapshot.data.data;
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return BannerWidget(
              height: 200,
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
      },
    );
  }

  Widget pandaChinaLiveItem(BuildContext context, HomeChinaLiveEntity entity) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
        color: Colors.white,
        child: Column(children: <Widget>[
          HeaderItem(title: entity.title),
          Divider(height: 2.0, color: Colors.black26),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.8,
            physics: NeverScrollableScrollPhysics(),
            children: entity.list
                .map((entity) => GridItem(
                      title: entity.title,
                      image: entity.image,
                      imageTitle: "live",
                      imageHeight: size.width / 3,
                    ))
                .toList(),
          )
        ]));
  }

  Widget pandaListItem(BuildContext context, HomeListEntity entity) {
    return FutureBuilder<HomePandaVideoEntity>(
      future: fetchPandaVideo(entity.listUrl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<HomePandaVideoListEntity> listEntity = snapshot.data.list;
          return Container(
              margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
              color: Colors.white,
              child: Column(children: <Widget>[
                HeaderItem(title: entity.title),
                Divider(height: 2.0, color: Colors.black26),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 5.4,
                  physics: NeverScrollableScrollPhysics(),
                  children: listEntity
                      .map((entity) => ListItem(
                            image: entity.image,
                            imageTitle: entity.videoLength,
                            title: entity.title,
                            subTitle: entity.daytime,
                          ))
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

  Widget pandaCctvItem(BuildContext context, HomeCctvEntity entity) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<HomeWonderfulEntity>(
      future: fetchWonderful(entity.listUrl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<HomeCctvListEntity> listEntity = snapshot.data.list;
          return Container(
              margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
              color: Colors.white,
              child: Column(children: <Widget>[
                HeaderItem(title: entity.title),
                Divider(height: 2.0, color: Colors.black26),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 0.73,
                  physics: NeverScrollableScrollPhysics(),
                  children: listEntity
                      .map((entity) => GridItem(
                            title: entity.title,
                            littleTitle: entity.daytime,
                            image: entity.image,
                            imageTitle: entity.videoLength,
                            imageHeight: size.width / 1.9,
                          ))
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

  Widget pandaLiveItem(BuildContext context, HomePandaLiveEntity entity) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
        color: Colors.white,
        child: Column(children: <Widget>[
          HeaderItem(title: entity.title),
          Divider(height: 2.0, color: Colors.black26),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.8,
            physics: NeverScrollableScrollPhysics(),
            children: entity.list
                .map((entity) => GridItem(
                      title: entity.title,
                      image: entity.image,
                      imageTitle: "live",
                      imageHeight: (size.width / 3) - 20,
                    ))
                .toList(),
          )
        ]));
  }

  Widget pandaEyeItem(HomePandaEyeEntity entity) {
    return Container(
        margin: EdgeInsets.only(top: 6.0, left: 10.0, right: 10.0),
        color: Colors.white,
        child: Column(children: <Widget>[
          HeaderItem(title: entity.title),
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
                            margin: EdgeInsets.all(2.0),
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
