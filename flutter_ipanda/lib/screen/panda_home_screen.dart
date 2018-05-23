import 'package:flutter/material.dart';
import 'package:flutter_banner_widget/banner/banner_widget.dart';
import 'package:flutter_ipanda/entity/tab_home_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';

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
    ThemeData themeData = Theme.of(context);
    return Container(
        color: Colors.black26,
        child: Column(children: <Widget>[
          BannerWidget(
            entity: entity.banner,
            bannerPress: (position, entity) {},
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(6.0),
              color: Colors.white,
              child: Column(children: <Widget>[
                Padding(
                    child: Text(entity.pandaEye.title,
                        style: TextStyle(color: Colors.blue)),
                    padding: EdgeInsets.all(10.0)),
              ])),
        ]));
  }
}
