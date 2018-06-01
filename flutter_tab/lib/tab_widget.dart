import 'package:flutter/material.dart';
import 'package:flutter_tab/tab_entity.dart';
import 'package:meta/meta.dart';

class TabWidget extends StatefulWidget {
  final List<TabEntity> entity;
  final List<Widget> children;
  final int initialPage;

  TabWidget(
      {Key key,
      @required this.entity,
      @required this.children,
      this.initialPage = 0})
      : assert(entity.length == children.length,
            'please check entity or children length'),
        super(key: key);

  @override
  State<StatefulWidget> createState() => TabState();
}

class TabState extends State<TabWidget> {
  PageController controller;
  int selectIndex = 0;

  @override
  void initState() {
    controller = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Container(
          color: Colors.red,
          height: 50.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.entity.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: Text(widget.entity[index].title),
                width: size.width / widget.entity.length,
              );
            },
          )),
      Expanded(
          child: PageView.builder(
        itemCount: widget.entity.length,
        controller: controller,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) => widget.children[index],
      )),
    ]);
  }

  onPageChanged(index) {
    selectIndex = index % widget.entity.length;
    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
