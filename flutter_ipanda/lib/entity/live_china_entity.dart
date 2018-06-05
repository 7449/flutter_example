import 'package:json_annotation/json_annotation.dart';

part 'live_china_entity.g.dart';

@JsonSerializable()
class BaseLiveChinaEntity extends Object
    with _$BaseLiveChinaEntitySerializerMixin {
  @JsonKey(name: 'tablist')
  final List<LiveChinaTabListEntity> tabList;
  @JsonKey(name: 'alllist')
  final List<LiveChinaAllEntity> allList;

  factory BaseLiveChinaEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseLiveChinaEntityFromJson(json);

  BaseLiveChinaEntity(this.tabList, this.allList);
}

@JsonSerializable()
class LiveChinaTabListEntity extends Object
    with _$LiveChinaTabListEntitySerializerMixin {
  final String title;
  final String url;
  final String id;
  final String order;

  factory LiveChinaTabListEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveChinaTabListEntityFromJson(json);

  LiveChinaTabListEntity(this.title, this.url, this.id, this.order);
}

@JsonSerializable()
class LiveChinaAllEntity extends Object
    with _$LiveChinaAllEntitySerializerMixin {
  final String title;
  final String url;
  final String id;
  final String order;

  factory LiveChinaAllEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveChinaAllEntityFromJson(json);

  LiveChinaAllEntity(this.title, this.url, this.id, this.order);
}

@JsonSerializable()
class LiveChinaBaseListEntity extends Object
    with _$LiveChinaBaseListEntitySerializerMixin {
  final List<LiveChinaListEntity> live;

  factory LiveChinaBaseListEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveChinaBaseListEntityFromJson(json);

  LiveChinaBaseListEntity(this.live);
}

@JsonSerializable()
class LiveChinaListEntity extends Object
    with _$LiveChinaListEntitySerializerMixin {
  final String title;
  final String brief;
  final String image;
  final String order;
  final String id;

  factory LiveChinaListEntity.fromJson(Map<String, dynamic> json) =>
      _$LiveChinaListEntityFromJson(json);

  LiveChinaListEntity(this.title, this.brief, this.image, this.order, this.id);
}
