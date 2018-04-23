import 'package:flutter/material.dart';
import 'package:zhihu_zhuan_lan/values.dart';

//已知问题:切换抽屉item，虽然`tab`显示的是第一个,页面却一直显示上一次点击的`tab`页数
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DrawerState();
}

class DrawerState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectDrawerTabIndex = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        vsync: this, length: getTabLength(selectDrawerTabIndex));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
        title: new Text(text,
            style: new TextStyle(
                color: selectDrawerTabIndex == index
                    ? Colors.blue
                    : Colors.black)),
        onTap: () {
          Navigator.pop(context);
          Scaffold
              .of(context)
              .showSnackBar(new SnackBar(content: new Text('开始加载$text')));
          setState(() {
            tabController =
                new TabController(vsync: this, length: getTabLength(index));
            selectDrawerTabIndex = index;
          });
        });
  }

  List getTabView(index) {
    return getTabTitle(index).map((text) => new Tab(text: text)).toList();
  }

  List getBodyView(index) {
    return getTabTitle(index)
        .map((text) => new Center(child: new Text(text)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      drawer: new Drawer(child: drawer()),
      appBar: new AppBar(
          title: new Text(drawerTabs[selectDrawerTabIndex]),
          bottom: new TabBar(
            controller: tabController,
            tabs: getTabView(selectDrawerTabIndex),
            isScrollable: true,
          )),
      body: new TabBarView(
          controller: tabController,
          children: getBodyView(selectDrawerTabIndex)),
    ));
  }
}
