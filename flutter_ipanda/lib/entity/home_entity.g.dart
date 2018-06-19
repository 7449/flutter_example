// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseHomeEntity _$BaseHomeEntityFromJson(Map<String, dynamic> json) =>
    new BaseHomeEntity(json['data'] == null
        ? null
        : new HomeDataEntity.fromJson(json['data'] as Map<String, dynamic>));

abstract class _$BaseHomeEntitySerializerMixin {
  HomeDataEntity get data;
  Map<String, dynamic> toJson() => <String, dynamic>{'data': data};
}

HomeDataEntity _$HomeDataEntityFromJson(Map<String, dynamic> json) =>
    new HomeDataEntity(
        (json['bigImg'] as List)
            ?.map((e) => e == null
                ? null
                : new SimpleBannerEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['area'] == null
            ? null
            : new HomeAreaEntity.fromJson(json['area'] as Map<String, dynamic>),
        json['pandaeye'] == null
            ? null
            : new HomePandaEyeEntity.fromJson(
                json['pandaeye'] as Map<String, dynamic>),
        json['pandalive'] == null
            ? null
            : new HomePandaLiveEntity.fromJson(
                json['pandalive'] as Map<String, dynamic>),
        json['wallive'] == null
            ? null
            : new HomeWallLiveEntity.fromJson(
                json['wallive'] as Map<String, dynamic>),
        json['chinalive'] == null
            ? null
            : new HomeChinaLiveEntity.fromJson(
                json['chinalive'] as Map<String, dynamic>),
        json['interactive'] == null
            ? null
            : new HomeInteractiveEntity.fromJson(
                json['interactive'] as Map<String, dynamic>),
        json['cctv'] == null
            ? null
            : new HomeCctvEntity.fromJson(json['cctv'] as Map<String, dynamic>),
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomeDataEntitySerializerMixin {
  List<SimpleBannerEntity> get banner;
  HomeAreaEntity get area;
  HomePandaEyeEntity get pandaEye;
  HomePandaLiveEntity get pandaLive;
  HomeWallLiveEntity get wallLive;
  HomeChinaLiveEntity get chinaLive;
  HomeInteractiveEntity get interactive;
  HomeCctvEntity get cctv;
  List<HomeListEntity> get list;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'bigImg': banner,
        'area': area,
        'pandaeye': pandaEye,
        'pandalive': pandaLive,
        'wallive': wallLive,
        'chinalive': chinaLive,
        'interactive': interactive,
        'cctv': cctv,
        'list': list
      };
}

SimpleBannerEntity _$SimpleBannerEntityFromJson(Map<String, dynamic> json) =>
    new SimpleBannerEntity(
        json['image'] as String,
        json['title'] as String,
        json['url'] as String,
        json['id'] as String,
        json['type'] as String,
        json['stype'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$SimpleBannerEntitySerializerMixin {
  String get image;
  String get title;
  String get url;
  String get id;
  String get type;
  String get sType;
  String get pid;
  String get vid;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'image': image,
        'title': title,
        'url': url,
        'id': id,
        'type': type,
        'stype': sType,
        'pid': pid,
        'vid': vid,
        'order': order
      };
}

HomeAreaEntity _$HomeAreaEntityFromJson(Map<String, dynamic> json) =>
    new HomeAreaEntity(
        (json['listscroll'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeListScrollEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['listh'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeLisThEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['lists'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeListsEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['topiclist'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeTopicListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomeAreaEntitySerializerMixin {
  List<HomeListScrollEntity> get listScroll;
  List<HomeLisThEntity> get lisTh;
  List<HomeListsEntity> get lists;
  List<HomeTopicListEntity> get topicList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'listscroll': listScroll,
        'listh': lisTh,
        'lists': lists,
        'topiclist': topicList
      };
}

HomeListScrollEntity _$HomeListScrollEntityFromJson(
        Map<String, dynamic> json) =>
    new HomeListScrollEntity();

abstract class _$HomeListScrollEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomeLisThEntity _$HomeLisThEntityFromJson(Map<String, dynamic> json) =>
    new HomeLisThEntity();

abstract class _$HomeLisThEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomeListsEntity _$HomeListsEntityFromJson(Map<String, dynamic> json) =>
    new HomeListsEntity();

abstract class _$HomeListsEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomeTopicListEntity _$HomeTopicListEntityFromJson(Map<String, dynamic> json) =>
    new HomeTopicListEntity();

abstract class _$HomeTopicListEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomePandaEyeEntity _$HomePandaEyeEntityFromJson(Map<String, dynamic> json) =>
    new HomePandaEyeEntity(
        json['title'] as String,
        json['pandaeyelogo'] as String,
        (json['items'] as List)
            ?.map((e) => e == null
                ? null
                : new HomePandaEyeItemEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomePandaEyeEntitySerializerMixin {
  String get title;
  String get log;
  List<HomePandaEyeItemEntity> get items;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'pandaeyelogo': log, 'items': items};
}

HomePandaEyeItemEntity _$HomePandaEyeItemEntityFromJson(
        Map<String, dynamic> json) =>
    new HomePandaEyeItemEntity(
        json['title'] as String,
        json['bgcolor'] as String,
        json['brief'] as String,
        json['url'] as String,
        json['id'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$HomePandaEyeItemEntitySerializerMixin {
  String get title;
  String get bgColor;
  String get brief;
  String get url;
  String get id;
  String get pid;
  String get vid;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'bgcolor': bgColor,
        'brief': brief,
        'url': url,
        'id': id,
        'pid': pid,
        'vid': vid,
        'order': order
      };
}

HomePandaLiveEntity _$HomePandaLiveEntityFromJson(Map<String, dynamic> json) =>
    new HomePandaLiveEntity(
        json['title'] as String,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new HomePandaLiveListEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomePandaLiveEntitySerializerMixin {
  String get title;
  List<HomePandaLiveListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'list': list};
}

HomePandaLiveListEntity _$HomePandaLiveListEntityFromJson(
        Map<String, dynamic> json) =>
    new HomePandaLiveListEntity(
        json['image'] as String,
        json['url'] as String,
        json['title'] as String,
        json['id'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$HomePandaLiveListEntitySerializerMixin {
  String get image;
  String get url;
  String get title;
  String get id;
  String get vid;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'image': image,
        'url': url,
        'title': title,
        'id': id,
        'vid': vid,
        'order': order
      };
}

HomeWallLiveEntity _$HomeWallLiveEntityFromJson(Map<String, dynamic> json) =>
    new HomeWallLiveEntity(
        json['title'] as String,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeWallLiveListEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomeWallLiveEntitySerializerMixin {
  String get title;
  List<HomeWallLiveListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'list': list};
}

HomeWallLiveListEntity _$HomeWallLiveListEntityFromJson(
        Map<String, dynamic> json) =>
    new HomeWallLiveListEntity();

abstract class _$HomeWallLiveListEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomeChinaLiveEntity _$HomeChinaLiveEntityFromJson(Map<String, dynamic> json) =>
    new HomeChinaLiveEntity(
        json['title'] as String,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeChinaLiveListEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomeChinaLiveEntitySerializerMixin {
  String get title;
  List<HomeChinaLiveListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'list': list};
}

HomeChinaLiveListEntity _$HomeChinaLiveListEntityFromJson(
        Map<String, dynamic> json) =>
    new HomeChinaLiveListEntity(
        json['image'] as String,
        json['url'] as String,
        json['title'] as String,
        json['id'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$HomeChinaLiveListEntitySerializerMixin {
  String get image;
  String get url;
  String get title;
  String get id;
  String get vid;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'image': image,
        'url': url,
        'title': title,
        'id': id,
        'vid': vid,
        'order': order
      };
}

HomeInteractiveEntity _$HomeInteractiveEntityFromJson(
        Map<String, dynamic> json) =>
    new HomeInteractiveEntity(
        (json['interactiveone'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeInteractiveOneEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
        (json['interactivetwo'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeInteractiveTwoEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomeInteractiveEntitySerializerMixin {
  List<HomeInteractiveOneEntity> get interactiveOne;
  List<HomeInteractiveTwoEntity> get interactiveTwo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'interactiveone': interactiveOne,
        'interactivetwo': interactiveTwo
      };
}

HomeInteractiveOneEntity _$HomeInteractiveOneEntityFromJson(
        Map<String, dynamic> json) =>
    new HomeInteractiveOneEntity();

abstract class _$HomeInteractiveOneEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomeInteractiveTwoEntity _$HomeInteractiveTwoEntityFromJson(
        Map<String, dynamic> json) =>
    new HomeInteractiveTwoEntity();

abstract class _$HomeInteractiveTwoEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomeCctvEntity _$HomeCctvEntityFromJson(Map<String, dynamic> json) =>
    new HomeCctvEntity(
        json['title'] as String,
        json['listurl'] as String,
        (json['listlive'] as List)
            ?.map((e) => e == null
                ? null
                : new HomeListLiveEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$HomeCctvEntitySerializerMixin {
  String get title;
  String get listUrl;
  List<HomeListLiveEntity> get listLive;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'listurl': listUrl,
        'listlive': listLive
      };
}

HomeListLiveEntity _$HomeListLiveEntityFromJson(Map<String, dynamic> json) =>
    new HomeListLiveEntity();

abstract class _$HomeListLiveEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

HomeListEntity _$HomeListEntityFromJson(Map<String, dynamic> json) =>
    new HomeListEntity(json['listUrl'] as String, json['title'] as String,
        json['type'] as String, json['order'] as String);

abstract class _$HomeListEntitySerializerMixin {
  String get listUrl;
  String get title;
  String get type;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'listUrl': listUrl,
        'title': title,
        'type': type,
        'order': order
      };
}

HomeWonderfulEntity _$HomeWonderfulEntityFromJson(Map<String, dynamic> json) =>
    new HomeWonderfulEntity((json['list'] as List)
        ?.map((e) => e == null
            ? null
            : new HomeCctvListEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$HomeWonderfulEntitySerializerMixin {
  List<HomeCctvListEntity> get list;
  Map<String, dynamic> toJson() => <String, dynamic>{'list': list};
}

HomeCctvListEntity _$HomeCctvListEntityFromJson(Map<String, dynamic> json) =>
    new HomeCctvListEntity(
        json['url'] as String,
        json['image'] as String,
        json['title'] as String,
        json['videoLength'] as String,
        json['id'] as String,
        json['daytime'] as String,
        json['type'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$HomeCctvListEntitySerializerMixin {
  String get url;
  String get image;
  String get title;
  String get videoLength;
  String get id;
  String get daytime;
  String get type;
  String get pid;
  String get vid;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'image': image,
        'title': title,
        'videoLength': videoLength,
        'id': id,
        'daytime': daytime,
        'type': type,
        'pid': pid,
        'vid': vid,
        'order': order
      };
}

HomePandaVideoEntity _$HomePandaVideoEntityFromJson(
        Map<String, dynamic> json) =>
    new HomePandaVideoEntity((json['list'] as List)
        ?.map((e) => e == null
            ? null
            : new HomePandaVideoListEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$HomePandaVideoEntitySerializerMixin {
  List<HomePandaVideoListEntity> get list;
  Map<String, dynamic> toJson() => <String, dynamic>{'list': list};
}

HomePandaVideoListEntity _$HomePandaVideoListEntityFromJson(
        Map<String, dynamic> json) =>
    new HomePandaVideoListEntity(
        json['url'] as String,
        json['image'] as String,
        json['title'] as String,
        json['videoLength'] as String,
        json['id'] as String,
        json['daytime'] as String,
        json['type'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$HomePandaVideoListEntitySerializerMixin {
  String get url;
  String get image;
  String get title;
  String get videoLength;
  String get id;
  String get daytime;
  String get type;
  String get pid;
  String get vid;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'image': image,
        'title': title,
        'videoLength': videoLength,
        'id': id,
        'daytime': daytime,
        'type': type,
        'pid': pid,
        'vid': vid,
        'order': order
      };
}
