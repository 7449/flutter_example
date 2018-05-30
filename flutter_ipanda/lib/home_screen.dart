import 'package:flutter/material.dart';
import 'package:flutter_ipanda/screen/panda_broadcast_screen.dart';
import 'package:flutter_ipanda/screen/panda_home_screen.dart';
import 'package:flutter_ipanda/screen/panda_live_china_screen.dart';
import 'package:flutter_ipanda/screen/panda_live_screen.dart';
import 'package:flutter_ipanda/screen/panda_video_screen.dart';
import 'package:flutter_ipanda/value.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrawerState();
}

class DrawerState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(), bottomNavigationBar: bottomNavigation());
  }

  Widget body() {
    switch (selectBottomIndex) {
      case 0:
        return PandaHomeScreen();
      case 1:
        return PandaLiveScreen();
      case 2:
        return PandaVideoScreen(url: tabUrlAction[selectBottomIndex]);
      case 3:
        return PandaBroadcastScreen(url: tabUrlAction[selectBottomIndex]);
      case 4:
        return PandaLiveChinaScreen(url: tabUrlAction[selectBottomIndex]);
    }
    return PandaHomeScreen();
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
