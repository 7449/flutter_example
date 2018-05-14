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
      DrawerState(voidCallback: voidCallback);

  HomeScreen({this.voidCallback});
}

class DrawerState extends State<HomeScreen> {
  int selectIndex = 0;
  String searchValue = '';
  final VoidCallback voidCallback;

  DrawerState({this.voidCallback});

  Widget drawer() {
    return Column(children: <Widget>[
//       DrawerHeader(child:  Text('codekk')),
      Container(
        color: Colors.grey,
        height: 160.0,
        child: Center(
            child: RaisedButton(onPressed: voidCallback, child: Text('修改主题'))),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: getDrawerTitle().length,
              itemBuilder: (context, index) => drawerListItem(context, index)))
    ]);
  }

  Widget drawerListItem(context, index) {
    String text = getDrawerTitle()[index];
    return ListTile(
        leading: Icon(Icons.android),
        title: Text(text,
            style: TextStyle(
                color: selectIndex == index ? Colors.blue : Colors.black)),
        onTap: () {
          Navigator.pop(context);
          Scaffold.of(context).showSnackBar(SnackBar(
              content:
                  Text('${index == 4 || index == 6 ? '暂未开放' : '开始加载$text'}')));
          setState(() => selectIndex = index);
        });
  }

  Widget bodyWidget(title) {
    switch (selectIndex) {
      case 0:
        return OpScreen(title: title);
      case 1:
        return OpaScreen(title: title);
      case 2:
        return JobScreen(title: title);
      case 3:
        return BlogScreen(title: title);
      case 5:
        return RecommendScreen(title: title);
    }
    return UnKnowScreen(title: title);
  }

  showDialogs() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                content: TextField(
                    decoration: InputDecoration(labelText: '请输入关键词'),
                    onChanged: (value) => setState(() => searchValue = value)),
                actions: <Widget>[
                  FlatButton(
                      child: Text('取消'),
                      onPressed: () => Navigator.pop(context)),
                  FlatButton(
                      child: Text('搜索'),
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
    return Scaffold(
        drawer: Drawer(child: drawer()),
        appBar: AppBar(title: Text(title), actions: <Widget>[
          Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                if (selectIndex == 2 ||
                    selectIndex == 3 ||
                    selectIndex == 4 ||
                    selectIndex == 6) {
                  Scaffold
                      .of(context)
                      .showSnackBar(SnackBar(content: Text('暂不支持搜索')));
                  return;
                }
                showDialogs();
              },
            );
          }),
          PopupMenuButton<MenuAction>(
              itemBuilder: (context) => <PopupMenuItem<MenuAction>>[
                    PopupMenuItem<MenuAction>(
                        value: MenuAction.setting, child: Text('设置')),
                    PopupMenuItem<MenuAction>(
                        value: MenuAction.about, child: Text('关于')),
                  ],
              onSelected: (MenuAction action) {
                switch (action) {
                  case MenuAction.setting:
                    startSettingScreen(context, () {
                      setState(() {});
                    });
                    break;
                  case MenuAction.about:
                    startAboutScreen(context);
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
