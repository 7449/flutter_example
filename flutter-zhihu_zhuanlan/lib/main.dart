import 'package:flutter/material.dart';
import 'package:zhihu_zhuan_lan/home_screen.dart';

// 入口，这里使用MaterialApp作为顶级入口,启动项目的启动页
// 当然,这有个缺点就是`ios`和`android`想要相同的效果就要一起替换
// 推荐使用flutter推荐的启动页方法
// 具体可以查看这篇blog：https://7449.github.io/2018/04/22/Android_Flutter_11/
void main() => runApp(new MaterialApp(home: new HomeScreen()));

// 这只是一种推荐方法,不是很推荐,如果在启动页放广告可以这样弄,但是私以为启动页应该
//以最快的速度进入app主页
//void main() => runApp(new MaterialApp(home: new SplashScreen()));
