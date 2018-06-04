import 'package:json_annotation/json_annotation.dart';

part 'broad_cast_entity.g.dart';

@JsonSerializable()
class BaseBroadcastEntity extends Object
    with _$BaseBroadcastEntitySerializerMixin {
  final List<BroadcastBigImageEntity> bigImg;
  @JsonKey(name: 'listurl')
  final String listUrl;

  factory BaseBroadcastEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseBroadcastEntityFromJson(json);

  BaseBroadcastEntity(this.bigImg, this.listUrl);
}

@JsonSerializable()
class BroadcastBigImageEntity extends Object
    with _$BroadcastBigImageEntitySerializerMixin {
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

  factory BroadcastBigImageEntity.fromJson(Map<String, dynamic> json) =>
      _$BroadcastBigImageEntityFromJson(json);

  BroadcastBigImageEntity(this.url, this.image, this.title, this.id, this.sType,
      this.type, this.pid, this.vid, this.order);
}

@JsonSerializable()
class BroadcastListEntity extends Object
    with _$BroadcastListEntitySerializerMixin {
  final int total;
  final List<BroadcastChildListEntity> list;

  factory BroadcastListEntity.fromJson(Map<String, dynamic> json) =>
      _$BroadcastListEntityFromJson(json);

  BroadcastListEntity(this.total, this.list);
}

@JsonSerializable()
class BroadcastChildListEntity extends Object
    with _$BroadcastChildListEntitySerializerMixin {
  final int num;
  @JsonKey(name: 'datatype')
  final String dataType;
  final String id;
  final String title;
  @JsonKey(name: 'videolength')
  final String videoLength;
  final String guid;
  @JsonKey(name: 'picurl')
  final String picUrl;
  final String order;
  @JsonKey(name: 'picurl2')
  final String picUrl2;
  @JsonKey(name: 'picurl3')
  final String picUrl3;
  final String url;
  @JsonKey(name: 'focus_date')
  final int focusDate;
  @JsonKey(name: 'isaixiyou')
  final String isAiXiYou;

  factory BroadcastChildListEntity.fromJson(Map<String, dynamic> json) =>
      _$BroadcastChildListEntityFromJson(json);

  BroadcastChildListEntity(
      this.num,
      this.dataType,
      this.id,
      this.title,
      this.videoLength,
      this.guid,
      this.picUrl,
      this.order,
      this.picUrl2,
      this.picUrl3,
      this.url,
      this.focusDate,
      this.isAiXiYou);
}
