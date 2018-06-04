import 'package:json_annotation/json_annotation.dart';

part 'video_entity.g.dart';

@JsonSerializable()
class BaseVideoEntity extends Object with _$BaseVideoEntitySerializerMixin {
  final List<VideoBigImageEntity> bigImg;
  final List<VideoListEntity> list;

  factory BaseVideoEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseVideoEntityFromJson(json);

  BaseVideoEntity(this.bigImg, this.list);
}

@JsonSerializable()
class VideoBigImageEntity extends Object
    with _$VideoBigImageEntitySerializerMixin {
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

  factory VideoBigImageEntity.fromJson(Map<String, dynamic> json) =>
      _$VideoBigImageEntityFromJson(json);

  VideoBigImageEntity(this.url, this.image, this.title, this.id, this.sType,
      this.type, this.pid, this.vid, this.order);
}

@JsonSerializable()
class VideoListEntity extends Object with _$VideoListEntitySerializerMixin {
  final String url;
  final String image;
  final String title;
  final String brief;
  final String type;
  final String videoLength;
  final String id;
  final String order;

  factory VideoListEntity.fromJson(Map<String, dynamic> json) =>
      _$VideoListEntityFromJson(json);

  VideoListEntity(this.url, this.image, this.title, this.brief, this.type,
      this.videoLength, this.id, this.order);
}
