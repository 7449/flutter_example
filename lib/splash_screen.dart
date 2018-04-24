import 'package:flutter/material.dart';
import 'package:zhihu_zhuan_lan/home_screen.dart';
import 'package:zhihu_zhuan_lan/values.dart';

//废弃
// 初始化一个闪屏页
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashState();
}

class SplashState extends State<SplashScreen> with TickerProviderStateMixin {
  // 动画
  Animation animation;

  // 动画管理器
  AnimationController controller;

  var animationStateListener;

  initState() {
    super.initState();
    //初始化动画管理器
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    //初始化动画
    animation = new Tween(begin: 0.0, end: 1.0).animate(controller);
    animationStateListener = (status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new HomeScreen()),
            (route) => route == null);
      }
    };
    //注册动画观察者
    animation.addStatusListener((status) => animationStateListener(status));
    //启动动画
    controller.forward();
  }

  /// 观察动画状态,在结束的时候启动到新的页面,
  /// 这里使用的是`pushAndRemoveUntil`而不是`push`
  /// 因为闪屏页跳转之后需要销毁,而`pushAndRemoveUntil`会删除之前的所有页面,只留下跳转的那个

  Widget build(BuildContext context) {
    return new FadeTransition(
        opacity: animation,
        child: new Image.asset(
          SplashImage,
          fit: BoxFit.cover,
        ));
  }

  dispose() {
    controller.removeStatusListener(animationStateListener);
    controller.dispose();
    super.dispose();
  }
}
