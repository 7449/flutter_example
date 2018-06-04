import 'package:flutter/material.dart';
import 'package:flutter_tab_widget/tab_entity.dart';
import 'package:meta/meta.dart';

typedef void OnPageChanged(int position);

class TabWidget extends StatefulWidget {
  final List<TabEntity> entity;
  final OnPageChanged onPageChanged;
  final List<Widget> children;
  final Color tabColor;
  final double tabHeight;
  final Color tabTextSelectColor;
  final Color tabTextUnSelectColor;
  final int initialPage;

  TabWidget(
      {Key key,
      @required this.entity,
      @required this.children,
      this.tabTextSelectColor = Colors.white,
      this.tabTextUnSelectColor = Colors.white70,
      this.onPageChanged,
      this.tabColor = Colors.blue,
      this.tabHeight = 50.0,
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
          height: widget.tabHeight,
          color: widget.tabColor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.entity.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.entity[index].title,
                      style: new TextStyle(
                          color: selectIndex == index
                              ? widget.tabTextSelectColor
                              : widget.tabTextUnSelectColor),
                    ),
                    width: size.width / widget.entity.length,
                  ),
                  onTap: () {
                    selectIndex = index;
                    setState(() {});
                    controller.jumpToPage(index);
                  });
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
    selectIndex = index;
    setState(() {});
    if (widget.onPageChanged != null) widget.onPageChanged(selectIndex);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
