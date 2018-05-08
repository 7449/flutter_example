import 'package:flutter/material.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';

class AboutScreen extends StatelessWidget {
  List<Widget> list() {
    List<Widget> list = <Widget>[];
    list.add(aboutItem('项目地址', 'https://github.com/7449/flutter_example'));
    list.add(new Padding(
        padding: const EdgeInsets.all(6.0), child: const Text('pubspec')));
    list.add(aboutItem('cupertino_icons',
        'https://pub.dartlang.org/packages/cupertino_icons'));
    list.add(aboutItem('http', 'https://pub.dartlang.org/packages/http'));
    list.add(aboutItem('json_serializable',
        'https://pub.dartlang.org/packages/json_serializable'));
    list.add(aboutItem(
        'build_runner', 'https://pub.dartlang.org/packages/build_runner'));
    list.add(aboutItem('flutter_webview_plugin',
        'https://pub.dartlang.org/packages/flutter_webview_plugin'));
    list.add(aboutItem('shared_preferences',
        'https://pub.dartlang.org/packages/shared_preferences'));
    list.add(aboutItem(
        'url_launcher', 'https://pub.dartlang.org/packages/url_launcher'));
    list.add(new Padding(
        padding: const EdgeInsets.all(6.0), child: const Text('blog')));
    list.add(aboutItem('Flutter番外篇:Dart',
        'https://7449.github.io/2018/03/18/Android_Flutter_dart/'));
    list.add(aboutItem(
        '什么是Flutter', 'https://7449.github.io/2018/03/19/Android_Flutter_1/'));
    list.add(aboutItem(
        '安装Flutter', 'https://7449.github.io/2018/03/19/Android_Flutter_2/'));
    list.add(aboutItem('编写一个FlutterApp',
        'https://7449.github.io/2018/03/26/Android_Flutter_3/'));
    list.add(aboutItem(
        '框架预览', 'https://7449.github.io/2018/03/26/Android_Flutter_4/'));
    list.add(aboutItem(
        'Widget目录', 'https://7449.github.io/2018/04/12/Android_Flutter_5/'));
    list.add(aboutItem('面对Android开发的Flutter说明',
        'https://7449.github.io/2018/04/16/Android_Flutter_6/'));
    list.add(aboutItem('面对ReactNative开发的Flutter说明',
        'https://7449.github.io/2018/04/17/Android_Flutter_7/'));
    list.add(aboutItem(
        '手势', 'https://7449.github.io/2018/04/20/Android_Flutter_8/'));
    list.add(aboutItem(
        '动画', 'https://7449.github.io/2018/04/20/Android_Flutter_9/'));
    list.add(aboutItem(
        '布局约束', 'https://7449.github.io/2018/04/21/Android_Flutter_10/'));
    list.add(aboutItem('处理 assets 和 图像',
        'https://7449.github.io/2018/04/22/Android_Flutter_11/'));
    list.add(aboutItem('json序列化',
        'https://7449.github.io/2018/05/02/Android_Flutter_json_serializable/'));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: new FlexibleSpaceBar(
              title: const Text('关于'),
              centerTitle: false,
              background: new Image.asset(
                'lib/image/icon_example.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          new SliverList(delegate: new SliverChildListDelegate(list())),
        ],
      ),
    );
  }
}
