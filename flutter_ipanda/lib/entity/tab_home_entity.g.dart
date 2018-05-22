// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_home_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TabHomeEntity _$TabHomeEntityFromJson(Map<String, dynamic> json) =>
    new TabHomeEntity(json['data'] == null
        ? null
        : new TabDataEntity.fromJson(json['data'] as Map<String, dynamic>));

abstract class _$TabHomeEntitySerializerMixin {
  TabDataEntity get data;
  Map<String, dynamic> toJson() => <String, dynamic>{'data': data};
}

TabDataEntity _$TabDataEntityFromJson(Map<String, dynamic> json) =>
    new TabDataEntity(
        (json['bigImg'] as List)
            ?.map((e) => e == null
                ? null
                : new SimpleBannerEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['area'] == null
            ? null
            : new AreaEntity.fromJson(json['area'] as Map<String, dynamic>),
        json['pandaeye'] == null
            ? null
            : new PandaEyeEntity.fromJson(
                json['pandaeye'] as Map<String, dynamic>),
        json['pandalive'] == null
            ? null
            : new PandaLiveEntity.fromJson(
                json['pandalive'] as Map<String, dynamic>),
        json['wallive'] == null
            ? null
            : new WallLiveEntity.fromJson(
                json['wallive'] as Map<String, dynamic>),
        json['chinalive'] == null
            ? null
            : new ChinaLiveEntity.fromJson(
                json['chinalive'] as Map<String, dynamic>),
        json['interactive'] == null
            ? null
            : new InteractiveEntity.fromJson(
                json['interactive'] as Map<String, dynamic>),
        json['cctv'] == null
            ? null
            : new CctvEntity.fromJson(json['cctv'] as Map<String, dynamic>),
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new ListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$TabDataEntitySerializerMixin {
  List<SimpleBannerEntity> get banner;
  AreaEntity get area;
  PandaEyeEntity get pandaEye;
  PandaLiveEntity get pandaLive;
  WallLiveEntity get wallLive;
  ChinaLiveEntity get chinaLive;
  InteractiveEntity get interactive;
  CctvEntity get cctv;
  List<ListEntity> get list;
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

AreaEntity _$AreaEntityFromJson(Map<String, dynamic> json) => new AreaEntity(
    (json['listscroll'] as List)
        ?.map((e) => e == null
            ? null
            : new ListScrollEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['listh'] as List)
        ?.map((e) => e == null
            ? null
            : new LisThEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['lists'] as List)
        ?.map((e) => e == null
            ? null
            : new ListsEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['topiclist'] as List)
        ?.map((e) => e == null
            ? null
            : new TopicListEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$AreaEntitySerializerMixin {
  List<ListScrollEntity> get listScroll;
  List<LisThEntity> get lisTh;
  List<ListsEntity> get lists;
  List<TopicListEntity> get topicList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'listscroll': listScroll,
        'listh': lisTh,
        'lists': lists,
        'topiclist': topicList
      };
}

ListScrollEntity _$ListScrollEntityFromJson(Map<String, dynamic> json) =>
    new ListScrollEntity();

abstract class _$ListScrollEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

LisThEntity _$LisThEntityFromJson(Map<String, dynamic> json) =>
    new LisThEntity();

abstract class _$LisThEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

ListsEntity _$ListsEntityFromJson(Map<String, dynamic> json) =>
    new ListsEntity();

abstract class _$ListsEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

TopicListEntity _$TopicListEntityFromJson(Map<String, dynamic> json) =>
    new TopicListEntity();

abstract class _$TopicListEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

PandaEyeEntity _$PandaEyeEntityFromJson(Map<String, dynamic> json) =>
    new PandaEyeEntity(
        json['title'] as String,
        json['pandaeyelogo'] as String,
        (json['items'] as List)
            ?.map((e) => e == null
                ? null
                : new PandaEyeItemEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$PandaEyeEntitySerializerMixin {
  String get title;
  String get log;
  List<PandaEyeItemEntity> get items;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'pandaeyelogo': log, 'items': items};
}

PandaEyeItemEntity _$PandaEyeItemEntityFromJson(Map<String, dynamic> json) =>
    new PandaEyeItemEntity(
        json['title'] as String,
        json['bgcolor'] as String,
        json['brief'] as String,
        json['url'] as String,
        json['id'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$PandaEyeItemEntitySerializerMixin {
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

PandaLiveEntity _$PandaLiveEntityFromJson(Map<String, dynamic> json) =>
    new PandaLiveEntity(
        json['title'] as String,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new PandaLiveListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$PandaLiveEntitySerializerMixin {
  String get title;
  List<PandaLiveListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'list': list};
}

PandaLiveListEntity _$PandaLiveListEntityFromJson(Map<String, dynamic> json) =>
    new PandaLiveListEntity(
        json['image'] as String,
        json['url'] as String,
        json['title'] as String,
        json['id'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$PandaLiveListEntitySerializerMixin {
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

WallLiveEntity _$WallLiveEntityFromJson(Map<String, dynamic> json) =>
    new WallLiveEntity(
        json['title'] as String,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new WallLiveListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$WallLiveEntitySerializerMixin {
  String get title;
  List<WallLiveListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'list': list};
}

WallLiveListEntity _$WallLiveListEntityFromJson(Map<String, dynamic> json) =>
    new WallLiveListEntity();

abstract class _$WallLiveListEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

ChinaLiveEntity _$ChinaLiveEntityFromJson(Map<String, dynamic> json) =>
    new ChinaLiveEntity(
        json['title'] as String,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new ChinaLiveListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$ChinaLiveEntitySerializerMixin {
  String get title;
  List<ChinaLiveListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'list': list};
}

ChinaLiveListEntity _$ChinaLiveListEntityFromJson(Map<String, dynamic> json) =>
    new ChinaLiveListEntity(
        json['image'] as String,
        json['url'] as String,
        json['title'] as String,
        json['id'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$ChinaLiveListEntitySerializerMixin {
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

InteractiveEntity _$InteractiveEntityFromJson(Map<String, dynamic> json) =>
    new InteractiveEntity(
        (json['interactiveone'] as List)
            ?.map((e) => e == null
                ? null
                : new InteractiveOneEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['interactivetwo'] as List)
            ?.map((e) => e == null
                ? null
                : new InteractiveTwoEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$InteractiveEntitySerializerMixin {
  List<InteractiveOneEntity> get interactiveOne;
  List<InteractiveTwoEntity> get interactiveTwo;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'interactiveone': interactiveOne,
        'interactivetwo': interactiveTwo
      };
}

InteractiveOneEntity _$InteractiveOneEntityFromJson(
        Map<String, dynamic> json) =>
    new InteractiveOneEntity();

abstract class _$InteractiveOneEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

InteractiveTwoEntity _$InteractiveTwoEntityFromJson(
        Map<String, dynamic> json) =>
    new InteractiveTwoEntity();

abstract class _$InteractiveTwoEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

CctvEntity _$CctvEntityFromJson(Map<String, dynamic> json) => new CctvEntity(
    json['title'] as String,
    json['listurl'] as String,
    (json['listlive'] as List)
        ?.map((e) => e == null
            ? null
            : new ListLiveEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$CctvEntitySerializerMixin {
  String get title;
  String get listUrl;
  List<ListLiveEntity> get listLive;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'listurl': listUrl,
        'listlive': listLive
      };
}

ListLiveEntity _$ListLiveEntityFromJson(Map<String, dynamic> json) =>
    new ListLiveEntity();

abstract class _$ListLiveEntitySerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

ListEntity _$ListEntityFromJson(Map<String, dynamic> json) => new ListEntity(
    json['listUrl'] as String,
    json['title'] as String,
    json['type'] as String,
    json['order'] as String);

abstract class _$ListEntitySerializerMixin {
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
