import 'package:flutter/material.dart';
import 'package:flutter_ipanda/entity/tab_home_entity.dart';
import 'package:flutter_ipanda/net/fetch.dart';

class PandaHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TabHomeEntity>(
      future: fetchHome(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(child: Text(snapshot.data.data.list.length.toString()));
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
