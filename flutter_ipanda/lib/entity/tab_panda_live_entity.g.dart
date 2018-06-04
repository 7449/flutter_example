// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_panda_live_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TabLiveEntity _$TabLiveEntityFromJson(Map<String, dynamic> json) =>
    new TabLiveEntity((json['tablist'] as List)
        ?.map((e) => e == null
            ? null
            : new LiveTabListEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$TabLiveEntitySerializerMixin {
  List<LiveTabListEntity> get tabList;
  Map<String, dynamic> toJson() => <String, dynamic>{'tablist': tabList};
}

LiveTabListEntity _$LiveTabListEntityFromJson(Map<String, dynamic> json) =>
    new LiveTabListEntity(json['title'] as String, json['url'] as String,
        json['id'] as String, json['order'] as String);

abstract class _$LiveTabListEntitySerializerMixin {
  String get title;
  String get url;
  String get id;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'id': id, 'order': order};
}

LivePandaEntity _$LivePandaEntityFromJson(Map<String, dynamic> json) =>
    new LivePandaEntity(
        (json['live'] as List)
            ?.map((e) => e == null
                ? null
                : new LiveHeaderEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['bookmark'] == null
            ? null
            : new LiveBookMarkEntity.fromJson(
                json['bookmark'] as Map<String, dynamic>));

abstract class _$LivePandaEntitySerializerMixin {
  List<LiveHeaderEntity> get live;
  LiveBookMarkEntity get bookmark;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'live': live, 'bookmark': bookmark};
}

LiveHeaderEntity _$LiveHeaderEntityFromJson(Map<String, dynamic> json) =>
    new LiveHeaderEntity(
        json['title'] as String,
        json['brief'] as String,
        json['image'] as String,
        json['id'] as String,
        json['isshow'] as String,
        json['url'] as String);

abstract class _$LiveHeaderEntitySerializerMixin {
  String get title;
  String get brief;
  String get image;
  String get id;
  String get isShow;
  String get url;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'brief': brief,
        'image': image,
        'id': id,
        'isshow': isShow,
        'url': url
      };
}

LiveBookMarkEntity _$LiveBookMarkEntityFromJson(Map<String, dynamic> json) =>
    new LiveBookMarkEntity(
        (json['multiple'] as List)
            ?.map((e) => e == null
                ? null
                : new LiveMultipleEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['watchTalk'] as List)
            ?.map((e) => e == null
                ? null
                : new LiveWatchTalkEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$LiveBookMarkEntitySerializerMixin {
  List<LiveMultipleEntity> get multiple;
  List<LiveWatchTalkEntity> get watchTalk;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'multiple': multiple, 'watchTalk': watchTalk};
}

LiveMultipleEntity _$LiveMultipleEntityFromJson(Map<String, dynamic> json) =>
    new LiveMultipleEntity(json['title'] as String, json['url'] as String,
        json['order'] as String);

abstract class _$LiveMultipleEntitySerializerMixin {
  String get title;
  String get url;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'order': order};
}

LiveWatchTalkEntity _$LiveWatchTalkEntityFromJson(Map<String, dynamic> json) =>
    new LiveWatchTalkEntity(json['title'] as String, json['url'] as String,
        json['order'] as String);

abstract class _$LiveWatchTalkEntitySerializerMixin {
  String get title;
  String get url;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'order': order};
}

BaseMultipleEntity _$BaseMultipleEntityFromJson(Map<String, dynamic> json) =>
    new BaseMultipleEntity((json['list'] as List)
        ?.map((e) => e == null
            ? null
            : new MultipleEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$BaseMultipleEntitySerializerMixin {
  List<MultipleEntity> get list;
  Map<String, dynamic> toJson() => <String, dynamic>{'list': list};
}

MultipleEntity _$MultipleEntityFromJson(Map<String, dynamic> json) =>
    new MultipleEntity(
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

abstract class _$MultipleEntitySerializerMixin {
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
