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
