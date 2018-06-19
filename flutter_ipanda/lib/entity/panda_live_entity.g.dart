// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panda_live_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePandaLiveEntity _$BasePandaLiveEntityFromJson(Map<String, dynamic> json) =>
    new BasePandaLiveEntity((json['tablist'] as List)
        ?.map((e) => e == null
            ? null
            : new PandaLiveTabListEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$BasePandaLiveEntitySerializerMixin {
  List<PandaLiveTabListEntity> get tabList;
  Map<String, dynamic> toJson() => <String, dynamic>{'tablist': tabList};
}

PandaLiveTabListEntity _$PandaLiveTabListEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaLiveTabListEntity(json['title'] as String, json['url'] as String,
        json['id'] as String, json['order'] as String);

abstract class _$PandaLiveTabListEntitySerializerMixin {
  String get title;
  String get url;
  String get id;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'id': id, 'order': order};
}

PandaLivePandaEntity _$PandaLivePandaEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaLivePandaEntity(
        (json['live'] as List)
            ?.map((e) => e == null
                ? null
                : new PandaLiveHeaderEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['bookmark'] == null
            ? null
            : new PandaLiveBookMarkEntity.fromJson(
                json['bookmark'] as Map<String, dynamic>));

abstract class _$PandaLivePandaEntitySerializerMixin {
  List<PandaLiveHeaderEntity> get live;
  PandaLiveBookMarkEntity get bookmark;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'live': live, 'bookmark': bookmark};
}

PandaLiveHeaderEntity _$PandaLiveHeaderEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaLiveHeaderEntity(
        json['title'] as String,
        json['brief'] as String,
        json['image'] as String,
        json['id'] as String,
        json['isshow'] as String,
        json['url'] as String);

abstract class _$PandaLiveHeaderEntitySerializerMixin {
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

PandaLiveBookMarkEntity _$PandaLiveBookMarkEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaLiveBookMarkEntity(
        (json['multiple'] as List)
            ?.map((e) => e == null
                ? null
                : new PandaLiveMultipleEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
        (json['watchTalk'] as List)
            ?.map((e) => e == null
                ? null
                : new PandaLiveWatchTalkEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList());

abstract class _$PandaLiveBookMarkEntitySerializerMixin {
  List<PandaLiveMultipleEntity> get multiple;
  List<PandaLiveWatchTalkEntity> get watchTalk;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'multiple': multiple, 'watchTalk': watchTalk};
}

PandaLiveMultipleEntity _$PandaLiveMultipleEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaLiveMultipleEntity(json['title'] as String, json['url'] as String,
        json['order'] as String);

abstract class _$PandaLiveMultipleEntitySerializerMixin {
  String get title;
  String get url;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'order': order};
}

PandaLiveWatchTalkEntity _$PandaLiveWatchTalkEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaLiveWatchTalkEntity(json['title'] as String, json['url'] as String,
        json['order'] as String);

abstract class _$PandaLiveWatchTalkEntitySerializerMixin {
  String get title;
  String get url;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'order': order};
}

PandaMultipleEntity _$PandaMultipleEntityFromJson(Map<String, dynamic> json) =>
    new PandaMultipleEntity((json['list'] as List)
        ?.map((e) => e == null
            ? null
            : new PandaMultipleChildEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$PandaMultipleEntitySerializerMixin {
  List<PandaMultipleChildEntity> get list;
  Map<String, dynamic> toJson() => <String, dynamic>{'list': list};
}

PandaMultipleChildEntity _$PandaMultipleChildEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaMultipleChildEntity(
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

abstract class _$PandaMultipleChildEntitySerializerMixin {
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

PandaWatchTalkEntity _$PandaWatchTalkEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaWatchTalkEntity((json['content'] as List)
        ?.map((e) => e == null
            ? null
            : new PandaWatchTalkChildEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$PandaWatchTalkEntitySerializerMixin {
  List<PandaWatchTalkChildEntity> get content;
  Map<String, dynamic> toJson() => <String, dynamic>{'content': content};
}

PandaWatchTalkChildEntity _$PandaWatchTalkChildEntityFromJson(
        Map<String, dynamic> json) =>
    new PandaWatchTalkChildEntity(
        json['pid'] as String,
        json['tid'] as String,
        json['piccount'] as int,
        json['message'] as String,
        json['mark'] as String,
        json['author'] as String,
        json['authorid'] as String,
        json['dateline'] as String,
        json['sub_count'] as String,
        json['stype'] as int,
        json['locale'] as String,
        json['agree'] as int,
        json['disagree'] as int,
        json['relative_time'] as int);

abstract class _$PandaWatchTalkChildEntitySerializerMixin {
  String get pid;
  String get tid;
  int get picCount;
  String get message;
  String get mark;
  String get author;
  String get authorId;
  String get dateline;
  String get subCount;
  int get sType;
  String get locale;
  int get agree;
  int get disagree;
  int get relativeTime;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'pid': pid,
        'tid': tid,
        'piccount': picCount,
        'message': message,
        'mark': mark,
        'author': author,
        'authorid': authorId,
        'dateline': dateline,
        'sub_count': subCount,
        'stype': sType,
        'locale': locale,
        'agree': agree,
        'disagree': disagree,
        'relative_time': relativeTime
      };
}
