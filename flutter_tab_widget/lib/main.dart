import 'package:flutter/material.dart';
import 'package:flutter_tab/tab_entity.dart';
import 'package:flutter_tab/tab_widget.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  final List<TabEntity> entity = [
    new TabEntity(title: '直播'),
    new TabEntity(title: '视频'),
    new TabEntity(title: '播报'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TabWidget'),
        elevation: 0.0,
      ),
      body: TabWidget(
        onPageChanged: (position) {
          print(position);
        },
        children: <Widget>[
          Container(color: Colors.white, child: Center(child: Text('直播'))),
          Container(color: Colors.pink, child: Center(child: Text('视频'))),
          Container(color: Colors.blue, child: Center(child: Text('播报'))),
        ],
        entity: entity,
      ),
    );
  }
}
