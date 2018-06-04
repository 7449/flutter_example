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
