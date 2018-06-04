import 'package:json_annotation/json_annotation.dart';

part 'tab_video_entity.g.dart';

@JsonSerializable()
class BaseVideoEntity extends Object with _$BaseVideoEntitySerializerMixin {
  final List<BigImageEntity> bigImg;
  final List<ListEntity> list;

  factory BaseVideoEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseVideoEntityFromJson(json);

  BaseVideoEntity(this.bigImg, this.list);
}

@JsonSerializable()
class BigImageEntity extends Object with _$BigImageEntitySerializerMixin {
  final String url;
  final String image;
  final String title;
  final String id;
  @JsonKey(name: 'stype')
  final String sType;
  final String type;
  final String pid;
  final String vid;
  final String order;

  factory BigImageEntity.fromJson(Map<String, dynamic> json) =>
      _$BigImageEntityFromJson(json);

  BigImageEntity(this.url, this.image, this.title, this.id, this.sType,
      this.type, this.pid, this.vid, this.order);
}

@JsonSerializable()
class ListEntity extends Object with _$ListEntitySerializerMixin {
  final String url;
  final String image;
  final String title;
  final String brief;
  final String type;
  final String videoLength;
  final String id;
  final String order;

  factory ListEntity.fromJson(Map<String, dynamic> json) =>
      _$ListEntityFromJson(json);

  ListEntity(this.url, this.image, this.title, this.brief, this.type,
      this.videoLength, this.id, this.order);
}
