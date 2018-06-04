import 'package:json_annotation/json_annotation.dart';

part 'tab_panda_live_entity.g.dart';

@JsonSerializable()
class TabLiveEntity extends Object with _$TabLiveEntitySerializerMixin {
  @JsonKey(name: 'tablist')
  final List<LiveTabListEntity> tabList;

  factory TabLiveEntity.fromJson(Map<String, dynamic> json) =>
      _$TabLiveEntityFromJson(json);

  TabLiveEntity(this.tabList);
}

@JsonSerializable()
class LiveTabListEntity extends Object with _$LiveTabListEntitySerializerMixin {
  final String title;
  final String url;
  final String id;
  final String order;

  factory LiveTabListEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveTabListEntityFromJson(json);

  LiveTabListEntity(this.title, this.url, this.id, this.order);
}

@JsonSerializable()
class LivePandaEntity extends Object with _$LivePandaEntitySerializerMixin {
  @JsonKey(name: 'live')
  final List<LiveHeaderEntity> live;
  final LiveBookMarkEntity bookmark;

  factory LivePandaEntity.fromJson(Map<String, dynamic> json) =>
      _$LivePandaEntityFromJson(json);

  LivePandaEntity(this.live, this.bookmark);
}

@JsonSerializable()
class LiveHeaderEntity extends Object with _$LiveHeaderEntitySerializerMixin {
  final String title;
  final String brief;
  final String image;
  final String id;
  @JsonKey(name: 'isshow')
  final String isShow;
  final String url;

  factory LiveHeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveHeaderEntityFromJson(json);

  LiveHeaderEntity(
      this.title, this.brief, this.image, this.id, this.isShow, this.url);
}

@JsonSerializable()
class LiveBookMarkEntity extends Object
    with _$LiveBookMarkEntitySerializerMixin {
  final List<LiveMultipleEntity> multiple;
  final List<LiveWatchTalkEntity> watchTalk;

  factory LiveBookMarkEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveBookMarkEntityFromJson(json);

  LiveBookMarkEntity(this.multiple, this.watchTalk);
}

@JsonSerializable()
class LiveMultipleEntity extends Object
    with _$LiveMultipleEntitySerializerMixin {
  final String title;
  final String url;
  final String order;

  factory LiveMultipleEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveMultipleEntityFromJson(json);

  LiveMultipleEntity(this.title, this.url, this.order);
}

@JsonSerializable()
class LiveWatchTalkEntity extends Object
    with _$LiveWatchTalkEntitySerializerMixin {
  final String title;
  final String url;
  final String order;

  factory LiveWatchTalkEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveWatchTalkEntityFromJson(json);

  LiveWatchTalkEntity(this.title, this.url, this.order);
}

@JsonSerializable()
class BaseMultipleEntity extends Object
    with _$BaseMultipleEntitySerializerMixin {
  final List<MultipleEntity> list;

  factory BaseMultipleEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseMultipleEntityFromJson(json);

  BaseMultipleEntity(this.list);
}

@JsonSerializable()
class MultipleEntity extends Object with _$MultipleEntitySerializerMixin {
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

  factory MultipleEntity.fromJson(Map<String, dynamic> json) =>
      _$MultipleEntityFromJson(json);

  MultipleEntity(this.url, this.image, this.title, this.videoLength, this.id,
      this.daytime, this.type, this.pid, this.vid, this.order);
}
