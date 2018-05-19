import 'package:flutter/material.dart';
import 'package:flutter_banner_widget/banner/banner_entity.dart';
import 'package:flutter_banner_widget/banner/banner_widget.dart';

void main() => runApp(MaterialApp(home: HomePage()));

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

class HomePage extends StatelessWidget {
  final GlobalKey<BannerState> globalKey = new GlobalKey<BannerState>();

  final List<SimpleEntity> entity = [
    new SimpleEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814594647287.jpg',
        title: '治愈系小可爱和你说晚安~',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDEKRkGRBOtjr33LfKamvlM180518.shtml'),
    new SimpleEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814220084352.jpg',
        title: '“太妃糖”：麻麻，我走啦！',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDEhZDFWlTidfugBlZa8qDl180518.shtml'),
    new SimpleEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814245872100.jpg',
        title: '冷静冷静，这也太有爱了吧~',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDERxEzGP40e4zIsKvZO0no180518.shtml'),
    new SimpleEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814175817985.jpg',
        title: '“福豹”：跟我一起嗨~',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDEIUt6LWRTnP5rBSqjqZRe180518.shtml'),
  ];

  final List<SimpleEntity> localEntity = [
    new SimpleEntity(
        url: 'lib/image/banner1.jpg', title: '本地资源第一张', obj: 'message'),
    new SimpleEntity(
        url: 'lib/image/banner2.jpg', title: '本地资源第二张', obj: 'message'),
    new SimpleEntity(
        url: 'lib/image/banner3.png', title: '本地资源第三张', obj: 'message'),
    new SimpleEntity(
        url: 'lib/image/banner4.jpg', title: '本地资源第四张', obj: 'message'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BannerWidget'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            BannerWidget(
              entity: entity,
              key: globalKey,
              delayTime: 500,
              duration: 500,
            ),
            Center(
                child: MaterialButton(
                    color: Colors.black12,
                    padding: EdgeInsets.all(6.0),
                    onPressed: () => globalKey.currentState.start(),
                    child: Text('start'))),
            Center(
                child: MaterialButton(
                    color: Colors.black12,
                    padding: EdgeInsets.all(6.0),
                    onPressed: () => globalKey.currentState.stop(),
                    child: Text('stop'))),
            new Padding(padding: EdgeInsets.all(6.0), child: Text('加载本地图片')),
            BannerWidget(
              build: (position, entity) {
                return Image.asset(entity.bannerUrl, fit: BoxFit.cover);
              },
              entity: localEntity,
              delayTime: 1000,
              duration: 1000,
            ),
          ],
        ),
      ),
    );
  }
}
