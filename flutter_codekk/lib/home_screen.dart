import 'package:flutter/material.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/screen/blog_screen.dart';
import 'package:flutter_codekk/screen/job_screen.dart';
import 'package:flutter_codekk/screen/op_screen.dart';
import 'package:flutter_codekk/screen/opa_screen.dart';
import 'package:flutter_codekk/screen/recommend_screen.dart';
import 'package:flutter_codekk/screen/unknown_screen.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/values.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback voidCallback;

  @override
  State<StatefulWidget> createState() =>
      new DrawerState(voidCallback: voidCallback);

  HomeScreen({this.voidCallback});
}

class DrawerState extends State<HomeScreen> {
  int selectIndex = 0;
  String searchValue = '';
  final VoidCallback voidCallback;

  DrawerState({this.voidCallback});

  Widget drawer() {
    return new Column(children: <Widget>[
//      new DrawerHeader(child: new Text('codekk')),
      new Container(
        color: Colors.grey,
        height: 160.0,
        child: new Center(
            child: new RaisedButton(
                onPressed: voidCallback, child: const Text('修改主题'))),
      ),
      new Expanded(
          child: new ListView.builder(
              itemCount: getDrawerTitle().length,
              itemBuilder: (context, index) => drawerListItem(context, index)))
    ]);
  }

  Widget drawerListItem(context, index) {
    String text = getDrawerTitle()[index];
    return new ListTile(
        leading: new Icon(Icons.android),
        title: new Text(text,
            style: new TextStyle(
                color: selectIndex == index ? Colors.blue : Colors.black)),
        onTap: () {
          Navigator.pop(context);
          Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text(
                  '${index == 4 || index == 6 ? '暂未开放' : '开始加载$text'}')));
          setState(() => selectIndex = index);
        });
  }

  Widget bodyWidget(title) {
    switch (selectIndex) {
      case 0:
        return new OpScreen(title: title);
      case 1:
        return new OpaScreen(title: title);
      case 2:
        return new JobScreen(title: title);
      case 3:
        return new BlogScreen(title: title);
      case 5:
        return new RecommendScreen(title: title);
    }
    return new UnKnowScreen(title: title);
  }

  showDialogs() {
    showDialog(
        context: context,
        builder: (context) => new AlertDialog(
                content: new TextField(
                    decoration: const InputDecoration(labelText: '请输入关键词'),
                    onChanged: (value) => setState(() => searchValue = value)),
                actions: <Widget>[
                  new FlatButton(
                      child: const Text('取消'),
                      onPressed: () => Navigator.pop(context)),
                  new FlatButton(
                      child: const Text('搜索'),
                      onPressed: () {
                        Navigator.pop(context);
                        startSearchScreen(
                            context,
                            searchValue,
                            selectIndex == 0
                                ? ApiType.OP
                                : selectIndex == 1
                                    ? ApiType.OPA
                                    : ApiType.RECOMMEND);
                      })
                ]));
  }

  @override
  Widget build(BuildContext context) {
    String title = getDrawerTitle()[selectIndex];
    return new Scaffold(
        drawer: new Drawer(child: drawer()),
        appBar: new AppBar(title: new Text(title), actions: <Widget>[
          new Builder(builder: (context) {
            return new IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                if (selectIndex == 2 ||
                    selectIndex == 3 ||
                    selectIndex == 4 ||
                    selectIndex == 6) {
                  Scaffold.of(context).showSnackBar(
                      const SnackBar(content: const Text('暂不支持搜索')));
                  return;
                }
                showDialogs();
              },
            );
          }),
          new PopupMenuButton<MenuAction>(
              itemBuilder: (context) => <PopupMenuItem<MenuAction>>[
                    const PopupMenuItem<MenuAction>(
                        value: MenuAction.setting, child: const Text('设置')),
                    const PopupMenuItem<MenuAction>(
                        value: MenuAction.about, child: const Text('关于')),
                  ],
              onSelected: (MenuAction action) {
                switch (action) {
                  case MenuAction.setting:
                    startSettingScreen(context, () {
                      setState(() {});
                    });
                    break;
                  case MenuAction.about:
                    break;
                }
              })
        ]),
        body: bodyWidget(title));
  }
}

enum MenuAction {
  setting,
  about,
}
