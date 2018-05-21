import 'package:flutter_banner_widget/banner/banner_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tab_home_entity.g.dart';

@JsonSerializable()
class TabHomeEntity extends Object with _$TabHomeEntitySerializerMixin {
  @JsonKey(name: 'bigImg')
  final List<SimpleBannerEntity> banner;
  final String area;
  @JsonKey(name: 'pandaeye')
  final String pandaEye;
  @JsonKey(name: 'pandalive')
  final String pandaLive;
  @JsonKey(name: 'wallive')
  final String wallLive;
  @JsonKey(name: 'chinalive')
  final String chinaLive;
  final String interactive;
  final String cctv;
  final String list;

  factory TabHomeEntity.fromJson(Map<String, dynamic> json) =>
      _$TabHomeEntityFromJson(json);
}

class SimpleBannerEntity extends BannerEntity
    with _$BannerEntitySerializerMixin {
  final String image;
  final String title;
  final String url;
  final String id;
  final String type;
  @JsonKey(name: 'stype')
  final String sType;
  final String pid;
  final String vid;
  final String order;

  @override
  get bannerTitle => title;

  @override
  get bannerUrl => image;

  factory SimpleBannerEntity.fromJson(Map<String, dynamic> json) =>
      _$SimpleBannerEntityFromJson(json);

  SimpleBannerEntity(this.image, this.title, this.url, this.id, this.type,
      this.sType, this.pid, this.vid, this.order);
}
