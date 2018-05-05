import 'package:flutter/material.dart';
import 'package:zhihu_zhuan_lan/tab_screen.dart';
import 'package:zhihu_zhuan_lan/values.dart';

///已知问题:切换抽屉item，虽然`tab`显示的是第一个,页面却一直显示上一次点击的`tab`页数
class HomeScreen extends StatefulWidget {
  //初始化 State
  @override
  State<StatefulWidget> createState() => new DrawerState();
}

class DrawerState extends State<HomeScreen> with TickerProviderStateMixin {
  //记录Drawer目前选中的角标
  int selectIndex = 0;

  //Tab管理器
  TabController tabController;

  @override
  void initState() {
    super.initState();
    //初始化Tab管理器
    tabController =
        new TabController(vsync: this, length: getTabLength(selectIndex));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// 初始化Drawer，这里使用两个Widget组合,一个Header，一个ListView
  /// ListView的好处是如果抽屉内容过多的话,可以自己处理滑动
  Widget drawer() {
    return new Column(
      children: <Widget>[
        new Container(
          color: Colors.grey,
          height: 160.0,
          child: const Center(child: const Text(HomeTitle)),
        ),
        new Expanded(
            child: new ListView.builder(
                itemCount: drawerTabs.length,
                itemBuilder: (context, index) =>
                    drawerListItem(context, index)))
      ],
    );
  }

  /// Drawer ListView Item
  /// 如果只是简单的Item ListTitle是个不错的选择
  /// 点击之后有个SnackBar提示然后重新初始化Tab管理器
  /// 因为目前为止Tab管理器的length不能动态设置
  /// 关闭抽屉 Navigator.pop(context);
  Widget drawerListItem(context, index) {
    var text = drawerTabs[index];
    return new ListTile(
        leading: const Icon(Icons.android),
        title: new Text(text,
            style: new TextStyle(
                color: selectIndex == index ? Colors.blue : Colors.black)),
        onTap: () {
          Navigator.pop(context);
          Scaffold
              .of(context)
              .showSnackBar(new SnackBar(content: new Text('开始加载$text')));
          setState(() {
            selectIndex = index;
            tabController =
                new TabController(vsync: this, length: getTabLength(index));
          });
        });
  }

  List getTabView(index) {
    return getTabTitle(index).map((text) => new Tab(text: text)).toList();
  }

  List<Widget> getBodyView(index) {
    List<String> tabList = getTabTitle(index);
    List<Widget> tabViews = [];
    for (int i = 0; i < tabList.length; i++) {
      tabViews.add(new TabScreen(suffix: getTabSuffix(index, i)));
    }
    return tabViews;
  }

  /// 这里没有使用 DefaultTabController,如果Tab的个数是固定的，推荐使用,
  /// 使用起来非常方便
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(child: drawer()),
      appBar: new AppBar(
          title: new Text(drawerTabs[selectIndex]),
          bottom: new TabBar(
            controller: tabController,
            tabs: getTabView(selectIndex),
            isScrollable: true,
          )),
      body: new TabBarView(
          controller: tabController, children: getBodyView(selectIndex)),
    );
  }
}
