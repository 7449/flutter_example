import 'package:flutter/material.dart';
import 'package:flutter_ipanda/screen/broadcast_screen.dart';
import 'package:flutter_ipanda/screen/home_screen.dart';
import 'package:flutter_ipanda/screen/live_china_screen.dart';
import 'package:flutter_ipanda/screen/live_screen.dart';
import 'package:flutter_ipanda/screen/video_screen.dart';
import 'package:flutter_ipanda/value.dart';

class AppScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<AppScreen> with SingleTickerProviderStateMixin {
  int selectBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(), bottomNavigationBar: bottomNavigation());
  }

  Widget body() {
    switch (selectBottomIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return LiveScreen();
      case 2:
        return VideoScreen();
      case 3:
        return BroadcastScreen();
      case 4:
        return LiveChinaScreen();
    }
    return HomeScreen();
  }

  Widget bottomNavigation() {
    List<BottomNavigationBarItem> list = [];
    for (var i = 0; i < tabs.length; i++) {
      list.add(BottomNavigationBarItem(
          title: Text(tabs[i]), icon: Icon(bottomIcon(i))));
    }
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => setState(() => selectBottomIndex = index),
      currentIndex: selectBottomIndex,
      items: list,
    );
  }
}
