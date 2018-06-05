import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/live_china_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';
import 'package:flutter_ipanda/screen/livechina/list_screen.dart';
import 'package:flutter_ipanda/value.dart';
import 'package:flutter_tab_widget/flutter_tab_widget.dart';

class LiveChinaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabs[4]),
      ),
      body: FutureBuilder<BaseLiveChinaEntity>(
        future: fetchLiveChina(),
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

  Widget _build(BuildContext context, BaseLiveChinaEntity entity) {
    List<TabEntity> tabEntity = [];
    List<Widget> children = [];
    entity.allList.forEach((entity) {
      tabEntity.add(new TabEntity(title: entity.title));
      children.add(ListScreen(url: entity.url));
    });
    return Stack(alignment: Alignment.topRight, children: <Widget>[
      InkWell(
          child: Container(
              height: 50.0,
              margin: EdgeInsets.only(right: 5.0),
              alignment: Alignment.centerRight,
              child: Icon(Icons.add))),
      TabWidget(
        scrooll: true,
        tabMargin: EdgeInsets.only(right: 40.0),
        entity: tabEntity,
        tabColor: Colors.white,
        tabTextSelectColor: Colors.blue,
        tabTextUnSelectColor: Colors.black,
        children: children,
      ),
    ]);
  }
}
