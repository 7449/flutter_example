import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/multi_item_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String opTag = 'op_tag';
final String opaTag = 'opa_tag';
final String blogTag = 'blog_tag';

class SettingScreen extends StatefulWidget {
  final VoidCallback voidCallback;

  SettingScreen({this.voidCallback});

  @override
  State<StatefulWidget> createState() =>
      new SettingState(voidCallback: voidCallback);
}

class SettingState extends State<SettingScreen> {
  final VoidCallback voidCallback;

  SettingState({this.voidCallback});

  final List<MultiMenu> item = <MultiMenu>[
    new MultiMenu(SettingItem.title, '开源项目', opTag),
    new MultiMenu(SettingItem.item, '显示TAG', opTag),
    new MultiMenu(SettingItem.title, '源码解析', opaTag),
    new MultiMenu(SettingItem.item, '显示TAG', opaTag),
    new MultiMenu(SettingItem.title, '博客文章', blogTag),
    new MultiMenu(SettingItem.item, '显示TAG', blogTag),
  ];

  bool showOpTag = false;
  bool showOpaTag = false;
  bool showBlogTag = false;

  getTag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showOpTag = prefs.getBool(opTag);
    showOpaTag = prefs.getBool(opaTag);
    showBlogTag = prefs.getBool(blogTag);
    setState(() {});
  }

  setTag(String tag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showTag = prefs.getBool(tag);
    await prefs.setBool(tag, showTag == null ? true : !showTag);
    getTag();
  }

  @override
  void initState() {
    getTag(); // currentState null at this time, so the app crashes.
    super.initState();
  }

  Widget titleWidget(MultiMenu entity) {
    return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(entity.message,
            style: new TextStyle(color: Colors.pinkAccent)));
  }

  Widget itemWidget(MultiMenu entity) {
    return new InkWell(
        onTap: () {
          setTag(entity.itemType);
          setState(() {});
          voidCallback();
        },
        child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Expanded(child: new Text(entity.message)),
                new Checkbox(
                    value: entity.itemType == opTag
                        ? showOpTag
                        : entity.itemType == opaTag ? showOpaTag : showBlogTag,
                    onChanged: (bool) {}),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: const Text('设置')),
        body: new ListView.builder(
          padding: kMaterialListPadding,
          itemCount: item.length,
          itemBuilder: (context, index) {
            MultiMenu menu = item[index];
            switch (menu.type) {
              case SettingItem.item:
                return itemWidget(menu);
              case SettingItem.title:
                return titleWidget(menu);
            }
          },
        ));
  }
}
