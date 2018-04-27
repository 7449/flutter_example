import 'package:flutter/material.dart';
import 'package:flutter_codekk/screen/blog_screen.dart';
import 'package:flutter_codekk/screen/job_screen.dart';
import 'package:flutter_codekk/screen/op_screen.dart';
import 'package:flutter_codekk/screen/opa_screen.dart';
import 'package:flutter_codekk/screen/recommend_screen.dart';
import 'package:flutter_codekk/screen/unknown_screen.dart';
import 'package:flutter_codekk/values.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DrawerState();
}

class DrawerState extends State<HomeScreen> {
  int selectIndex = 0;

  Widget drawer() {
    return new Column(children: <Widget>[
//      new DrawerHeader(child: new Text('codekk')),
      new Container(
        color: Colors.grey,
        height: 160.0,
        child: new Center(child: new Text('codeKK')),
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

  @override
  Widget build(BuildContext context) {
    String title = getDrawerTitle()[selectIndex];
    return new Scaffold(
        drawer: new Drawer(child: drawer()),
        appBar: new AppBar(title: new Text(title)),
        body: bodyWidget(title));
  }
}
