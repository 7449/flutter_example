import 'package:flutter_banner_widget/banner/banner_entity.dart';

class SimpleBannerEntity extends BannerEntity {
  final String obj;
  final String url;
  final String title;

  SimpleBannerEntity({this.obj, this.url, this.title});

  @override
  get bannerTitle => title;

  @override
  get bannerUrl => url;
}
