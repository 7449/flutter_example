import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_banner_widget/banner/banner_entity.dart';
import 'package:meta/meta.dart';
import 'package:transparent_image/transparent_image.dart';

const CountMax = 0x7fffffff;

typedef void OnBannerPress(int position, BannerEntity entity);
typedef Widget Build(int position, BannerEntity entity);

class BannerWidget extends StatefulWidget {
  final OnBannerPress bannerPress;
  final Build build;
  final List<BannerEntity> entity; //数据
  final int height; // 高度
  final int delayTime; // 时间 (毫秒)
  final int duration; // pageView切换速度 (毫秒)

  BannerWidget(
      {Key key,
      @required this.entity,
      this.height = 180,
      this.delayTime = 1500,
      this.duration = 1500,
      this.bannerPress,
      this.build})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => BannerState();
}

class BannerState extends State<BannerWidget> {
  Timer timer;

  int selectIndex = 0;

  PageController controller;

  @override
  void initState() {
    double current = (CountMax / 2) - ((CountMax / 2) % widget.entity.length);
    controller = PageController(initialPage: current.toInt());
    start();
    super.initState();
  }

  start() {
    stop();
    timer = Timer.periodic(Duration(milliseconds: widget.delayTime), (timer) {
      controller.animateToPage(controller.page.toInt() + 1,
          duration: Duration(milliseconds: widget.duration),
          curve: Curves.linear);
    });
  }

  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height.toDouble(),
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
        return InkWell(
            onTap: () {
              if (widget.bannerPress != null)
                widget.bannerPress(selectIndex, widget.entity[selectIndex]);
            },
            child: widget.build == null
                ? FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        widget.entity[index % widget.entity.length].bannerUrl,
                    fit: BoxFit.cover)
                : widget.build(
                    index, widget.entity[index % widget.entity.length]));
      },
    );
  }

  Widget tips() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 32.0,
          padding: EdgeInsets.all(6.0),
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.entity[selectIndex].bannerTitle,
                  style: new TextStyle(color: Colors.white)),
              Row(children: circle())
            ],
          ),
        ));
  }

  List<Widget> circle() {
    List<Widget> circle = [];
    for (var i = 0; i < widget.entity.length; i++) {
      circle.add(Container(
        margin: EdgeInsets.all(2.0),
        width: 8.0,
        height: 8.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: selectIndex == i ? Colors.blue : Colors.white,
        ),
      ));
    }
    return circle;
  }

  onPageChanged(index) {
    selectIndex = index % widget.entity.length;
    setState(() {});
  }

  @override
  void dispose() {
    stop();
    controller?.dispose();
    super.dispose();
  }
}
