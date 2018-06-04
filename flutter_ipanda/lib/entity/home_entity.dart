import 'package:flutter_banner_widget/banner/banner_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';

@JsonSerializable()
class BaseHomeEntity extends Object with _$BaseHomeEntitySerializerMixin {
  final HomeDataEntity data;

  factory BaseHomeEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseHomeEntityFromJson(json);

  BaseHomeEntity(this.data);
}

@JsonSerializable()
class HomeDataEntity extends Object with _$HomeDataEntitySerializerMixin {
  @JsonKey(name: 'bigImg')
  final List<SimpleBannerEntity> banner;
  final HomeAreaEntity area;
  @JsonKey(name: 'pandaeye')
  final HomePandaEyeEntity pandaEye;
  @JsonKey(name: 'pandalive')
  final HomePandaLiveEntity pandaLive;
  @JsonKey(name: 'wallive')
  final HomeWallLiveEntity wallLive;
  @JsonKey(name: 'chinalive')
  final HomeChinaLiveEntity chinaLive;
  final HomeInteractiveEntity interactive;
  final HomeCctvEntity cctv;
  final List<HomeListEntity> list;

  factory HomeDataEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeDataEntityFromJson(json);

  HomeDataEntity(this.banner, this.area, this.pandaEye, this.pandaLive,
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
class HomeAreaEntity extends Object with _$HomeAreaEntitySerializerMixin {
  @JsonKey(name: 'listscroll')
  final List<HomeListScrollEntity> listScroll;
  @JsonKey(name: 'listh')
  final List<HomeLisThEntity> lisTh;
  @JsonKey(name: 'lists')
  final List<HomeListsEntity> lists;
  @JsonKey(name: 'topiclist')
  final List<HomeTopicListEntity> topicList;

  factory HomeAreaEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeAreaEntityFromJson(json);

  HomeAreaEntity(this.listScroll, this.lisTh, this.lists, this.topicList);
}

@JsonSerializable()
class HomeListScrollEntity extends Object
    with _$HomeListScrollEntitySerializerMixin {
  factory HomeListScrollEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeListScrollEntityFromJson(json);

  HomeListScrollEntity();
}

@JsonSerializable()
class HomeLisThEntity extends Object with _$HomeLisThEntitySerializerMixin {
  factory HomeLisThEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeLisThEntityFromJson(json);

  HomeLisThEntity();
}

@JsonSerializable()
class HomeListsEntity extends Object with _$HomeListsEntitySerializerMixin {
  factory HomeListsEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeListsEntityFromJson(json);

  HomeListsEntity();
}

@JsonSerializable()
class HomeTopicListEntity extends Object
    with _$HomeTopicListEntitySerializerMixin {
  factory HomeTopicListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeTopicListEntityFromJson(json);

  HomeTopicListEntity();
}

@JsonSerializable()
class HomePandaEyeEntity extends Object
    with _$HomePandaEyeEntitySerializerMixin {
  final String title;
  @JsonKey(name: 'pandaeyelogo')
  final String log;
  final List<HomePandaEyeItemEntity> items;

  factory HomePandaEyeEntity.fromJson(Map<String, dynamic> json) =>
      _$HomePandaEyeEntityFromJson(json);

  HomePandaEyeEntity(this.title, this.log, this.items);
}

@JsonSerializable()
class HomePandaEyeItemEntity extends Object
    with _$HomePandaEyeItemEntitySerializerMixin {
  final String title;
  @JsonKey(name: 'bgcolor')
  final String bgColor;
  final String brief;
  final String url;
  final String id;
  final String pid;
  final String vid;
  final String order;

  factory HomePandaEyeItemEntity.fromJson(Map<String, dynamic> json) =>
      _$HomePandaEyeItemEntityFromJson(json);

  HomePandaEyeItemEntity(this.title, this.bgColor, this.brief, this.url,
      this.id, this.pid, this.vid, this.order);
}

@JsonSerializable()
class HomePandaLiveEntity extends Object
    with _$HomePandaLiveEntitySerializerMixin {
  final String title;
  final List<HomePandaLiveListEntity> list;

  factory HomePandaLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$HomePandaLiveEntityFromJson(json);

  HomePandaLiveEntity(this.title, this.list);
}

@JsonSerializable()
class HomePandaLiveListEntity extends Object
    with _$HomePandaLiveListEntitySerializerMixin {
  final String image;
  final String url;
  final String title;
  final String id;
  final String vid;
  final String order;

  factory HomePandaLiveListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomePandaLiveListEntityFromJson(json);

  HomePandaLiveListEntity(
      this.image, this.url, this.title, this.id, this.vid, this.order);
}

@JsonSerializable()
class HomeWallLiveEntity extends Object
    with _$HomeWallLiveEntitySerializerMixin {
  final String title;
  final List<HomeWallLiveListEntity> list;

  factory HomeWallLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeWallLiveEntityFromJson(json);

  HomeWallLiveEntity(this.title, this.list);
}

@JsonSerializable()
class HomeWallLiveListEntity extends Object
    with _$HomeWallLiveListEntitySerializerMixin {
  factory HomeWallLiveListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeWallLiveListEntityFromJson(json);

  HomeWallLiveListEntity();
}

@JsonSerializable()
class HomeChinaLiveEntity extends Object
    with _$HomeChinaLiveEntitySerializerMixin {
  final String title;
  final List<HomeChinaLiveListEntity> list;

  factory HomeChinaLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeChinaLiveEntityFromJson(json);

  HomeChinaLiveEntity(this.title, this.list);
}

@JsonSerializable()
class HomeChinaLiveListEntity extends Object
    with _$HomeChinaLiveListEntitySerializerMixin {
  final String image;
  final String url;
  final String title;
  final String id;
  final String vid;
  final String order;

  factory HomeChinaLiveListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeChinaLiveListEntityFromJson(json);

  HomeChinaLiveListEntity(
      this.image, this.url, this.title, this.id, this.vid, this.order);
}

@JsonSerializable()
class HomeInteractiveEntity extends Object
    with _$HomeInteractiveEntitySerializerMixin {
  @JsonKey(name: 'interactiveone')
  final List<HomeInteractiveOneEntity> interactiveOne;
  @JsonKey(name: 'interactivetwo')
  final List<HomeInteractiveTwoEntity> interactiveTwo;

  factory HomeInteractiveEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeInteractiveEntityFromJson(json);

  HomeInteractiveEntity(this.interactiveOne, this.interactiveTwo);
}

@JsonSerializable()
class HomeInteractiveOneEntity extends Object
    with _$HomeInteractiveOneEntitySerializerMixin {
  factory HomeInteractiveOneEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeInteractiveOneEntityFromJson(json);

  HomeInteractiveOneEntity();
}

@JsonSerializable()
class HomeInteractiveTwoEntity extends Object
    with _$HomeInteractiveTwoEntitySerializerMixin {
  factory HomeInteractiveTwoEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeInteractiveTwoEntityFromJson(json);

  HomeInteractiveTwoEntity();
}

@JsonSerializable()
class HomeCctvEntity extends Object with _$HomeCctvEntitySerializerMixin {
  final String title;
  @JsonKey(name: 'listurl')
  final String listUrl;
  @JsonKey(name: 'listlive')
  final List<HomeListLiveEntity> listLive;

  factory HomeCctvEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeCctvEntityFromJson(json);

  HomeCctvEntity(this.title, this.listUrl, this.listLive);
}

@JsonSerializable()
class HomeListLiveEntity extends Object
    with _$HomeListLiveEntitySerializerMixin {
  factory HomeListLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeListLiveEntityFromJson(json);

  HomeListLiveEntity();
}

@JsonSerializable()
class HomeListEntity extends Object with _$HomeListEntitySerializerMixin {
  final String listUrl;
  final String title;
  final String type;
  final String order;

  factory HomeListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeListEntityFromJson(json);

  HomeListEntity(this.listUrl, this.title, this.type, this.order);
}

@JsonSerializable()
class HomeWonderfulEntity extends Object
    with _$HomeWonderfulEntitySerializerMixin {
  final List<HomeCctvListEntity> list;

  factory HomeWonderfulEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeWonderfulEntityFromJson(json);

  HomeWonderfulEntity(this.list);
}

@JsonSerializable()
class HomeCctvListEntity extends Object
    with _$HomeCctvListEntitySerializerMixin {
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

  factory HomeCctvListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomeCctvListEntityFromJson(json);

  HomeCctvListEntity(this.url, this.image, this.title, this.videoLength,
      this.id, this.daytime, this.type, this.pid, this.vid, this.order);
}

@JsonSerializable()
class HomePandaVideoEntity extends Object
    with _$HomePandaVideoEntitySerializerMixin {
  final List<HomePandaVideoListEntity> list;

  factory HomePandaVideoEntity.fromJson(Map<String, dynamic> json) =>
      _$HomePandaVideoEntityFromJson(json);

  HomePandaVideoEntity(this.list);
}

@JsonSerializable()
class HomePandaVideoListEntity extends Object
    with _$HomePandaVideoListEntitySerializerMixin {
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

  factory HomePandaVideoListEntity.fromJson(Map<String, dynamic> json) =>
      _$HomePandaVideoListEntityFromJson(json);

  HomePandaVideoListEntity(this.url, this.image, this.title, this.videoLength,
      this.id, this.daytime, this.type, this.pid, this.vid, this.order);
}
