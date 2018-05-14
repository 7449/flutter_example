import 'package:json_annotation/json_annotation.dart';

part 'tab_entity.g.dart';

@JsonSerializable()
class TabEntity extends Object with _$TabEntitySerializerMixin {
  final List<TabListEntity> tab;

  factory TabEntity.fromJson(Map<String, dynamic> json) =>
      _$TabEntityFromJson(json);

  TabEntity(this.tab);
}

@JsonSerializable()
class TabListEntity extends Object with _$TabListEntitySerializerMixin {
  final String title;
  @JsonKey(name: 'noimage')
  final String noImage;
  final String image;
  final String url;

  factory TabListEntity.fromJson(Map<String, dynamic> json) =>
      _$TabListEntityFromJson(json);

  TabListEntity(this.title, this.noImage, this.image, this.url);
}
