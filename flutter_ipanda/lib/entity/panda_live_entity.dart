import 'package:json_annotation/json_annotation.dart';

part 'panda_live_entity.g.dart';

@JsonSerializable()
class BasePandaLiveEntity extends Object
    with _$BasePandaLiveEntitySerializerMixin {
  @JsonKey(name: 'tablist')
  final List<PandaLiveTabListEntity> tabList;

  factory BasePandaLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$BasePandaLiveEntityFromJson(json);

  BasePandaLiveEntity(this.tabList);
}

@JsonSerializable()
class PandaLiveTabListEntity extends Object
    with _$PandaLiveTabListEntitySerializerMixin {
  final String title;
  final String url;
  final String id;
  final String order;

  factory PandaLiveTabListEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLiveTabListEntityFromJson(json);

  PandaLiveTabListEntity(this.title, this.url, this.id, this.order);
}

@JsonSerializable()
class PandaLivePandaEntity extends Object
    with _$PandaLivePandaEntitySerializerMixin {
  @JsonKey(name: 'live')
  final List<PandaLiveHeaderEntity> live;
  final PandaLiveBookMarkEntity bookmark;

  factory PandaLivePandaEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLivePandaEntityFromJson(json);

  PandaLivePandaEntity(this.live, this.bookmark);
}

@JsonSerializable()
class PandaLiveHeaderEntity extends Object
    with _$PandaLiveHeaderEntitySerializerMixin {
  final String title;
  final String brief;
  final String image;
  final String id;
  @JsonKey(name: 'isshow')
  final String isShow;
  final String url;

  factory PandaLiveHeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLiveHeaderEntityFromJson(json);

  PandaLiveHeaderEntity(
      this.title, this.brief, this.image, this.id, this.isShow, this.url);
}

@JsonSerializable()
class PandaLiveBookMarkEntity extends Object
    with _$PandaLiveBookMarkEntitySerializerMixin {
  final List<PandaLiveMultipleEntity> multiple;
  final List<PandaLiveWatchTalkEntity> watchTalk;

  factory PandaLiveBookMarkEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLiveBookMarkEntityFromJson(json);

  PandaLiveBookMarkEntity(this.multiple, this.watchTalk);
}

@JsonSerializable()
class PandaLiveMultipleEntity extends Object
    with _$PandaLiveMultipleEntitySerializerMixin {
  final String title;
  final String url;
  final String order;

  factory PandaLiveMultipleEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLiveMultipleEntityFromJson(json);

  PandaLiveMultipleEntity(this.title, this.url, this.order);
}

@JsonSerializable()
class PandaLiveWatchTalkEntity extends Object
    with _$PandaLiveWatchTalkEntitySerializerMixin {
  final String title;
  final String url;
  final String order;

  factory PandaLiveWatchTalkEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaLiveWatchTalkEntityFromJson(json);

  PandaLiveWatchTalkEntity(this.title, this.url, this.order);
}

@JsonSerializable()
class PandaMultipleEntity extends Object
    with _$PandaMultipleEntitySerializerMixin {
  final List<PandaMultipleChildEntity> list;

  factory PandaMultipleEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaMultipleEntityFromJson(json);

  PandaMultipleEntity(this.list);
}

@JsonSerializable()
class PandaMultipleChildEntity extends Object
    with _$PandaMultipleChildEntitySerializerMixin {
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

  factory PandaMultipleChildEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaMultipleChildEntityFromJson(json);

  PandaMultipleChildEntity(this.url, this.image, this.title, this.videoLength,
      this.id, this.daytime, this.type, this.pid, this.vid, this.order);
}

@JsonSerializable()
class PandaWatchTalkEntity extends Object
    with _$PandaWatchTalkEntitySerializerMixin {
  final List<PandaWatchTalkChildEntity> content;

  factory PandaWatchTalkEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaWatchTalkEntityFromJson(json);

  PandaWatchTalkEntity(this.content);
}

@JsonSerializable()
class PandaWatchTalkChildEntity extends Object
    with _$PandaWatchTalkChildEntitySerializerMixin {
  final String pid;
  final String tid;
  @JsonKey(name: 'piccount')
  final int picCount;
  final String message;
  final String mark;
  final String author;
  @JsonKey(name: 'authorid')
  final String authorId;
  final String dateline;
  @JsonKey(name: 'sub_count')
  final String subCount;
  @JsonKey(name: 'stype')
  final int sType;
  final String locale;
  final int agree;
  final int disagree;
  @JsonKey(name: 'relative_time')
  final int relativeTime;

  factory PandaWatchTalkChildEntity.fromJson(Map<String, dynamic> json) =>
      _$PandaWatchTalkChildEntityFromJson(json);

  PandaWatchTalkChildEntity(
      this.pid,
      this.tid,
      this.picCount,
      this.message,
      this.mark,
      this.author,
      this.authorId,
      this.dateline,
      this.subCount,
      this.sType,
      this.locale,
      this.agree,
      this.disagree,
      this.relativeTime);
}
