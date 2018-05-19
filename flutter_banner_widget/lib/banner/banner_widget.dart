import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_banner_widget/banner/banner_entity.dart';
import 'package:meta/meta.dart';
import 'package:transparent_image/transparent_image.dart';

const CountMax = 0x7fffffff;

class BannerWidget extends StatefulWidget {
  final List<BannerEntity> entity;

  BannerWidget({@required this.entity});

  @override
  State<StatefulWidget> createState() => BannerState(entity: entity);
}

class BannerState extends State<BannerWidget> {
  Timer timer;

  final List<BannerEntity> entity;
  int selectIndex = 0;

  PageController controller;

  BannerState({@required this.entity});

  @override
  void initState() {
    double current = (CountMax / 2) - ((CountMax / 2) % entity.length);
    controller = PageController(initialPage: current.toInt());
    start();
    super.initState();
  }

  start() {
    stop();
    timer = Timer.periodic(Duration(milliseconds: 1500), (timer) {
      controller.animateToPage(controller.page.toInt() + 1,
          duration: Duration(milliseconds: 1500), curve: Curves.linear);
    });
  }

  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260.0,
        color: Colors.black12,
        child: Stack(
          children: <Widget>[
            viewPager(),
            tips(),
          ],
        ));
  }

  Widget viewPager() {
    return PageView.builder(
      itemCount: CountMax,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: entity[index % entity.length].url,
            fit: BoxFit.cover);
      },
    );
  }

  Widget tips() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 36.0,
          padding: EdgeInsets.all(8.0),
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(entity[selectIndex].title,
                  style: new TextStyle(color: Colors.white)),
              Row(children: circle())
            ],
          ),
        ));
  }

  List<Widget> circle() {
    List<Widget> circle = [];
    for (var i = 0; i < entity.length; i++) {
      circle.add(Container(
        margin: EdgeInsets.all(2.0),
        width: 10.0,
        height: 10.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: selectIndex == i ? Colors.blue : Colors.white,
        ),
      ));
    }
    return circle;
  }

  onPageChanged(index) {
    selectIndex = index % entity.length;
    setState(() {});
  }

  @override
  void dispose() {
    stop();
    controller?.dispose();
    super.dispose();
  }
}
