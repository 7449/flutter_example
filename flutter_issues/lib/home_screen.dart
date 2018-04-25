import 'package:flutter/material.dart';
import 'package:flutter_tab/values.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DrawerState();
}

class DrawerState extends State<HomeScreen> with TickerProviderStateMixin {
  int selectIndex = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        vsync: this, length: getTabLength(selectIndex));
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
          child: new Center(child: new Text('Flutter')),
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
                color: selectIndex == index
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
            selectIndex = index;
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
          title: new Text(drawerTabs[selectIndex]),
          bottom: new TabBar(
            controller: tabController,
            tabs: getTabView(selectIndex),
//            isScrollable: true,
          )),
      body: new TabBarView(
          controller: tabController,
          children: getBodyView(selectIndex)),
    ));
  }
}
