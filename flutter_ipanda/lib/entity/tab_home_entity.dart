import 'package:flutter_banner_widget/banner/banner_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tab_home_entity.g.dart';

@JsonSerializable()
class TabHomeEntity extends Object with _$TabHomeEntitySerializerMixin {
  final TabDataEntity data;

  factory TabHomeEntity.fromJson(Map<String, dynamic> json) =>
      _$TabHomeEntityFromJson(json);

  TabHomeEntity(this.data);
}

@JsonSerializable()
class TabDataEntity extends Object with _$TabDataEntitySerializerMixin {
  @JsonKey(name: 'bigImg')
  final List<SimpleBannerEntity> banner;
  final AreaEntity area;
  @JsonKey(name: 'pandaeye')
  final PandaEyeEntity pandaEye;
  @JsonKey(name: 'pandalive')
  final PandaLiveEntity pandaLive;
  @JsonKey(name: 'wallive')
  final WallLiveEntity wallLive;
  @JsonKey(name: 'chinalive')
  final ChinaLiveEntity chinaLive;
  final InteractiveEntity interactive;
  final CctvEntity cctv;
  final List<ListEntity> list;

  factory TabDataEntity.fromJson(Map<String, dynamic> json) =>
      _$TabDataEntityFromJson(json);

  TabDataEntity(this.banner, this.area, this.pandaEye, this.pandaLive,
      this.wallLive, this.chinaLive, this.interactive, this.cctv, this.list);
}

@JsonSerializable()
class SimpleBannerEntity extends BannerEntity
    with _$SimpleBannerEntitySerializerMixin {
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

@JsonSerializable()
class AreaEntity extends Object with _$AreaEntitySerializerMixin {
  @JsonKey(name: 'listscroll')
  final List<ListScrollEntity> listScroll;
  @JsonKey(name: 'listh')
  final List<LisThEntity> lisTh;
  @JsonKey(name: 'lists')
  final List<ListsEntity> lists;
  @JsonKey(name: 'topiclist')
  final List<TopicListEntity> topicList;

  factory AreaEntity.fromJson(Map<String, dynamic> json) =>
      _$AreaEntityFromJson(json);

  AreaEntity(this.listScroll, this.lisTh, this.lists, this.topicList);
}

@JsonSerializable()
class ListScrollEntity extends Object with _$ListScrollEntitySerializerMixin {
  factory ListScrollEntity.fromJson(Map<String, dynamic> json) =>
      _$ListScrollEntityFromJson(json);

  ListScrollEntity();
}

@JsonSerializable()
class LisThEntity extends Object with _$LisThEntitySerializerMixin {
  factory LisThEntity.fromJson(Map<String, dynamic> json) =>
      _$LisThEntityFromJson(json);

  LisThEntity();
}

@JsonSerializable()
class ListsEntity extends Object with _$ListsEntitySerializerMixin {
  factory ListsEntity.fromJson(Map<String, dynamic> json) =>
      _$ListsEntityFromJson(json);

  ListsEntity();
}

@JsonSerializable()
class TopicListEntity extends Object with _$TopicListEntitySerializerMixin {
  factory TopicListEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicListEntityFromJson(json);

  TopicListEntity();
}

@JsonSerializable()
class PandaEyeEntity extends Object with _$PandaEyeEntitySerializerMixin {
  final String title;
  @JsonKey(name: 'pandaeyelogo')
  final String log;
  final List<PandaEyeItemEntity> items;

  factory PandaEyeEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaEyeEntityFromJson(json);

  PandaEyeEntity(this.title, this.log, this.items);
}

@JsonSerializable()
class PandaEyeItemEntity extends Object
    with _$PandaEyeItemEntitySerializerMixin {
  final String title;
  @JsonKey(name: 'bgcolor')
  final String bgColor;
  final String brief;
  final String url;
  final String id;
  final String pid;
  final String vid;
  final String order;

  factory PandaEyeItemEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaEyeItemEntityFromJson(json);

  PandaEyeItemEntity(this.title, this.bgColor, this.brief, this.url, this.id,
      this.pid, this.vid, this.order);
}

@JsonSerializable()
class PandaLiveEntity extends Object with _$PandaLiveEntitySerializerMixin {
  final String title;
  final List<PandaLiveListEntity> list;

  factory PandaLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLiveEntityFromJson(json);

  PandaLiveEntity(this.title, this.list);
}

@JsonSerializable()
class PandaLiveListEntity extends Object
    with _$PandaLiveListEntitySerializerMixin {
  final String image;
  final String url;
  final String title;
  final String id;
  final String vid;
  final String order;

  factory PandaLiveListEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLiveListEntityFromJson(json);

  PandaLiveListEntity(
      this.image, this.url, this.title, this.id, this.vid, this.order);
}

@JsonSerializable()
class WallLiveEntity extends Object with _$WallLiveEntitySerializerMixin {
  final String title;
  final List<WallLiveListEntity> list;

  factory WallLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$WallLiveEntityFromJson(json);

  WallLiveEntity(this.title, this.list);
}

@JsonSerializable()
class WallLiveListEntity extends Object
    with _$WallLiveListEntitySerializerMixin {
  factory WallLiveListEntity.fromJson(Map<String, dynamic> json) =>
      _$WallLiveListEntityFromJson(json);

  WallLiveListEntity();
}

@JsonSerializable()
class ChinaLiveEntity extends Object with _$ChinaLiveEntitySerializerMixin {
  final String title;
  final List<ChinaLiveListEntity> list;

  factory ChinaLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$ChinaLiveEntityFromJson(json);

  ChinaLiveEntity(this.title, this.list);
}

@JsonSerializable()
class ChinaLiveListEntity extends Object
    with _$ChinaLiveListEntitySerializerMixin {
  final String image;
  final String url;
  final String title;
  final String id;
  final String vid;
  final String order;

  factory ChinaLiveListEntity.fromJson(Map<String, dynamic> json) =>
      _$ChinaLiveListEntityFromJson(json);

  ChinaLiveListEntity(
      this.image, this.url, this.title, this.id, this.vid, this.order);
}

@JsonSerializable()
class InteractiveEntity extends Object with _$InteractiveEntitySerializerMixin {
  @JsonKey(name: 'interactiveone')
  final List<InteractiveOneEntity> interactiveOne;
  @JsonKey(name: 'interactivetwo')
  final List<InteractiveTwoEntity> interactiveTwo;

  factory InteractiveEntity.fromJson(Map<String, dynamic> json) =>
      _$InteractiveEntityFromJson(json);

  InteractiveEntity(this.interactiveOne, this.interactiveTwo);
}

@JsonSerializable()
class InteractiveOneEntity extends Object
    with _$InteractiveOneEntitySerializerMixin {
  factory InteractiveOneEntity.fromJson(Map<String, dynamic> json) =>
      _$InteractiveOneEntityFromJson(json);

  InteractiveOneEntity();
}

@JsonSerializable()
class InteractiveTwoEntity extends Object
    with _$InteractiveTwoEntitySerializerMixin {
  factory InteractiveTwoEntity.fromJson(Map<String, dynamic> json) =>
      _$InteractiveTwoEntityFromJson(json);

  InteractiveTwoEntity();
}

@JsonSerializable()
class CctvEntity extends Object with _$CctvEntitySerializerMixin {
  final String title;
  @JsonKey(name: 'listurl')
  final String listUrl;
  @JsonKey(name: 'listlive')
  final List<ListLiveEntity> listLive;

  factory CctvEntity.fromJson(Map<String, dynamic> json) =>
      _$CctvEntityFromJson(json);

  CctvEntity(this.title, this.listUrl, this.listLive);
}

@JsonSerializable()
class ListLiveEntity extends Object with _$ListLiveEntitySerializerMixin {
  factory ListLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$ListLiveEntityFromJson(json);

  ListLiveEntity();
}

@JsonSerializable()
class ListEntity extends Object with _$ListEntitySerializerMixin {
  final String listUrl;
  final String title;
  final String type;
  final String order;

  factory ListEntity.fromJson(Map<String, dynamic> json) =>
      _$ListEntityFromJson(json);

  ListEntity(this.listUrl, this.title, this.type, this.order);
}

@JsonSerializable()
class WonderfulEntity extends Object with _$WonderfulEntitySerializerMixin {
  final List<CctvListEntity> list;

  factory WonderfulEntity.fromJson(Map<String, dynamic> json) =>
      _$WonderfulEntityFromJson(json);

  WonderfulEntity(this.list);
}

@JsonSerializable()
class CctvListEntity extends Object with _$CctvListEntitySerializerMixin {
  final String url;
  final String image;
  final String title;
  final String videoLength;
  final String id;
  final String daytime;
  final String type;
  final String pid;
  final String vid;
  final String order;

  factory CctvListEntity.fromJson(Map<String, dynamic> json) =>
      _$CctvListEntityFromJson(json);

  CctvListEntity(this.url, this.image, this.title, this.videoLength, this.id,
      this.daytime, this.type, this.pid, this.vid, this.order);
}

@JsonSerializable()
class PandaVideoEntity extends Object with _$PandaVideoEntitySerializerMixin {
  final List<PandaVideoListEntity> list;

  factory PandaVideoEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaVideoEntityFromJson(json);

  PandaVideoEntity(this.list);
}

@JsonSerializable()
class PandaVideoListEntity extends Object
    with _$PandaVideoListEntitySerializerMixin {
  final String url;
  final String image;
  final String title;
  final String videoLength;
  final String id;
  final String daytime;
  final String type;
  final String pid;
  final String vid;
  final String order;

  factory PandaVideoListEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaVideoListEntityFromJson(json);

  PandaVideoListEntity(this.url, this.image, this.title, this.videoLength,
      this.id, this.daytime, this.type, this.pid, this.vid, this.order);
}
