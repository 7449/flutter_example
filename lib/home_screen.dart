import 'package:flutter/material.dart';
import 'package:zhihu_zhuan_lan/values.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DrawerState();
}

class DrawerState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int selectDrawerTabIndex = 0;

  Widget drawer() {
    return new Column(
      children: <Widget>[
        new Container(
          color: Colors.grey,
          height: 160.0,
          child: new Center(child: new Text(HomeTitle)),
        ),
        new Expanded(
            child: new ListView.builder(
                itemCount: drawerTabs.length,
                itemBuilder: (context, index) =>
                    drawerListItem(context, index)))
      ],
    );
  }

  Widget drawerListItem(context, index) {
    var text = drawerTabs[index];
    return new ListTile(
        leading: new Icon(Icons.android),
        title: new Text(text),
        onTap: () {
          Navigator.pop(context);
          Scaffold
              .of(context)
              .showSnackBar(new SnackBar(content: new Text('开始加载$text')));
          setState(() => selectDrawerTabIndex = index);
        });
  }

  List getTabView() {
    var tabTitles = [];
    switch (selectDrawerTabIndex) {
      case 0:
        tabTitles = zhihuTabs;
        break;
      case 1:
        tabTitles = movieTabs;
        break;
      case 2:
        tabTitles = musicTabs;
        break;
      case 3:
        tabTitles = developTabs;
        break;
      case 4:
        tabTitles = bookTabs;
        break;
      case 5:
        tabTitles = internetTabs;
        break;
    }
    return tabTitles.map((text) => new Tab(text: text)).toList();
  }

  List getBodyView() {
    var tabTitles = [];
    switch (selectDrawerTabIndex) {
      case 0:
        tabTitles = zhihuTabs;
        break;
      case 1:
        tabTitles = movieTabs;
        break;
      case 2:
        tabTitles = musicTabs;
        break;
      case 3:
        tabTitles = developTabs;
        break;
      case 4:
        tabTitles = bookTabs;
        break;
      case 5:
        tabTitles = internetTabs;
        break;
    }
    return tabTitles.map((text) => new Center(child: new Text(text))).toList();
  }

  @override
  Widget build(BuildContext context) {
    var views = getTabView();
    return new MaterialApp(
        home: new DefaultTabController(
            length: 20,
            child: new Scaffold(
              drawer: new Drawer(child: drawer()),
              appBar: new AppBar(
                  title: new Text(drawerTabs[selectDrawerTabIndex]),
                  bottom: new TabBar(
                    tabs: views,
                    isScrollable: true,
                  )),
              body: new TabBarView(children: getBodyView()),
            )));
  }
}
