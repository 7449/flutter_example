import 'package:flutter/material.dart';
import 'package:flutter_banner_widget/flutter_banner_widget.dart';
import 'package:flutter_ipanda/entity/simple_banner_entity.dart';
import 'package:meta/meta.dart';

class PandaHomeScreen extends StatelessWidget {
  final List<SimpleBannerEntity> entity = [
    new SimpleBannerEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814594647287.jpg',
        title: '治愈系小可爱和你说晚安~',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDEKRkGRBOtjr33LfKamvlM180518.shtml'),
    new SimpleBannerEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814220084352.jpg',
        title: '“太妃糖”：麻麻，我走啦！',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDEhZDFWlTidfugBlZa8qDl180518.shtml'),
    new SimpleBannerEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814245872100.jpg',
        title: '冷静冷静，这也太有爱了吧~',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDERxEzGP40e4zIsKvZO0no180518.shtml'),
    new SimpleBannerEntity(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814175817985.jpg',
        title: '“福豹”：跟我一起嗨~',
        obj:
            'http://live.ipanda.com/2018/05/18/VIDEIUt6LWRTnP5rBSqjqZRe180518.shtml'),
  ];
  final String url;

  PandaHomeScreen({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          BannerWidget(
            entity: entity,
            bannerPress: (position, entity) {
              SimpleBannerEntity bannerEntity = entity;
              print('position:${position},entity:${bannerEntity.obj}');
            },
          ),
        ],
      ),
    );
  }
}
