// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

BaseVideoEntity _$BaseVideoEntityFromJson(Map<String, dynamic> json) =>
    new BaseVideoEntity(
        (json['bigImg'] as List)
            ?.map((e) => e == null
                ? null
                : new VideoBigImageEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new VideoListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$BaseVideoEntitySerializerMixin {
  List<VideoBigImageEntity> get bigImg;
  List<VideoListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'bigImg': bigImg, 'list': list};
}

VideoBigImageEntity _$VideoBigImageEntityFromJson(Map<String, dynamic> json) =>
    new VideoBigImageEntity(
        json['url'] as String,
        json['image'] as String,
        json['title'] as String,
        json['id'] as String,
        json['stype'] as String,
        json['type'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$VideoBigImageEntitySerializerMixin {
  String get url;
  String get image;
  String get title;
  String get id;
  String get sType;
  String get type;
  String get pid;
  String get vid;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'image': image,
        'title': title,
        'id': id,
        'stype': sType,
        'type': type,
        'pid': pid,
        'vid': vid,
        'order': order
      };
}

VideoListEntity _$VideoListEntityFromJson(Map<String, dynamic> json) =>
    new VideoListEntity(
        json['url'] as String,
        json['image'] as String,
        json['title'] as String,
        json['brief'] as String,
        json['type'] as String,
        json['videoLength'] as String,
        json['id'] as String,
        json['order'] as String);

abstract class _$VideoListEntitySerializerMixin {
  String get url;
  String get image;
  String get title;
  String get brief;
  String get type;
  String get videoLength;
  String get id;
  String get order;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'image': image,
        'title': title,
        'brief': brief,
        'type': type,
        'videoLength': videoLength,
        'id': id,
        'order': order
      };
}
