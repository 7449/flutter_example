# flutter_example
flutter code

## update log

#### 运行项目

请使用最新版本的`flutter`运行`demo`

####    18.6.3

新增[Tab](https://github.com/7449/flutter_example/blob/master/flutter_tab_widget)

####    18.5.19

新增[BannerWidget轮播图](https://github.com/7449/flutter_example/blob/master/flutter_banner_widget/lib)

####    18.5.14

去掉`new`以及`const`关键字

## 项目地址

[Flutter示例集合](https://github.com/7449/flutter_example)

#### 项目blog

[初始化项目和闪屏页](https://7449.github.io/2018/04/23/android_flutter_splash.html)<br>
[添加Tab和Drawer](https://7449.github.io/2018/04/24/android_flutter_drawer.html)<br>
[列表页完善,网络请求](https://7449.github.io/2018/04/24/android_flutter_net_list.html)<br>
[列表详情页](https://7449.github.io/2018/04/25/android_flutter_net_list_detail.html)<br>

## flutter

[github地址](https://github.com/flutter/flutter)<br>
[官方地址](https://flutter.io/)<br>
[官方文档地址](https://flutter.io/docs/)<br>
[Flutter中文开发者论坛](http://flutter-dev.com/)<br>
[中文文档](http://doc.flutter-dev.cn/)<br>

## blog

[Flutter番外篇:Dart](https://7449.github.io/2018/03/18/android_flutter_dart.html)<br>
[第一章：什么是Flutter](https://7449.github.io/2018/03/19/android_flutter_1.html)<br>
[第二章：安装Flutter](https://7449.github.io/2018/03/19/android_flutter_2.html)<br>
[第三章：编写一个FlutterApp](https://7449.github.io/2018/03/26/android_flutter_3.html)<br>
[第四章：框架预览](https://7449.github.io/2018/03/26/android_flutter_4.html)<br>
[第五章：Widget目录](https://7449.github.io/2018/04/12/android_flutter_5.html)<br>
[第六章：面对Android开发的Flutter说明](https://7449.github.io/2018/04/16/android_flutter_6.html)<br>
[第七章：面对ReactNative开发的Flutter说明](https://7449.github.io/2018/04/17/android_flutter_7.html)<br>
[第八章：手势](https://7449.github.io/2018/04/20/android_flutter_8.html)<br>
[第九章：动画](https://7449.github.io/2018/04/20/android_flutter_9.html)<br>
[第十章：布局约束](https://7449.github.io/2018/04/21/android_flutter_10.html)<br>
[第十一章：处理 assets 和 图像](https://7449.github.io/2018/04/22/android_flutter_11.html)<br>
[json序列化](https://7449.github.io/2018/05/02/android_flutter_json_serializable.html)

## flutter_tab_widget

![](https://github.com/7449/flutter_example/blob/master/flutter_tab_widget.gif)

#### 使用方法

> 适用于嵌套Tab.

      final List<TabEntity> entity = [
        new TabEntity(title: '直播'),
        new TabEntity(title: '视频'),
        new TabEntity(title: '播报'),
      ];
      
       @override
       Widget build(BuildContext context) {
         return Scaffold(
           appBar: AppBar(
             title: Text('Flutter TabWidget'),
             elevation: 0.0,
           ),
           body: TabWidget(
             onPageChanged: (position) {
               print(position);
             },
             children: <Widget>[
               Container(color: Colors.white, child: Center(child: Text('直播'))),
               Container(color: Colors.pink, child: Center(child: Text('视频'))),
               Container(color: Colors.blue, child: Center(child: Text('播报'))),
             ],
             entity: entity,
           ),
         );
       }

## flutter_banner_widget

![](https://github.com/7449/flutter_example/blob/master/flutter_banner_widget.gif)

#### 使用方法

继承[BannerEntity](https://github.com/7449/flutter_example/blob/master/flutter_banner_widget/lib/banner/banner_entity.dart),实现两个方法

示例：

    class SimpleEntity extends BannerEntity {
      final String obj;
      final String url;
      final String title;
    
      SimpleEntity({this.obj, this.url, this.title});
    
      @override
      get bannerUrl => url;
    
      @override
      get bannerTitle => title;
    }
    
或者：
    
    class SimpleEntity extends Object with BannerEntity {
      final String obj;
      final String url;
      final String title;
    
      SimpleEntity({this.obj, this.url, this.title});
    
      @override
      get bannerUrl => url;
    
      @override
      get bannerTitle => title;
    }
    
widget:

     BannerWidget(entity: entity)
     
##### 加载本地图片

实现`build`方法，返回对应的`widget`

      BannerWidget(
                  build: (position, entity) {
                    return Image.asset(entity.bannerUrl, fit: BoxFit.cover);
                  },
                  entity: localEntity,
                )
                
##### 点击事件

    BannerWidget(
                entity: entity,
                bannerPress: (position, entity) {
                  SimpleEntity bannerEntity = entity;
                  print('position:${position},entity:${bannerEntity.obj}');
                },
              )

## flutter_zhihu_zhuanlan 

> 目前没有比较好的办法加载一段`html`代码,只能以`text`的形式直接显示

![](https://github.com/7449/flutter_example/blob/master/flutter_zhihu_zhuanlan.gif)

## flutter_codekk

> 目前[codeKK-Android](https://github.com/7449/codeKK-Android)的功能已经使用`flutter`全部实现

 ~~项目因为使用了`json_serializable`,但是没有提交自动生成的文件,需要在运行之前执行`flutter packages pub run build_runner build`
否则`entity`目录会报错~~

因为`flutter`处于急速更迭中,有时候会和插件有冲突,为了防止这种事情发生,提交`.g`文件

布局的几种模式可以查看[StatusWidget](https://github.com/7449/flutter_example/blob/master/flutter_codekk/lib/widget/status_widget.dart),截图只展示`ERROR`

![](https://github.com/7449/flutter_example/blob/master/flutter_codekk_screen.gif)
![](https://github.com/7449/flutter_example/blob/master/flutter_codekk_theme_screen.gif)
![](https://github.com/7449/flutter_example/blob/master/flutter_codekk_status_screen.gif)
![](https://github.com/7449/flutter_example/blob/master/flutter_codekk_chip_screen.gif)
