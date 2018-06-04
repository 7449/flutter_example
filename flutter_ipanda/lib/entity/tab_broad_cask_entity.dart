import 'package:json_annotation/json_annotation.dart';

part 'tab_broad_cask_entity.g.dart';

@JsonSerializable()
class BaseBroadcastEntity extends Object
    with _$BaseBroadcastEntitySerializerMixin {
  final List<BigImageEntity> bigImg;
  @JsonKey(name: 'listurl')
  final String listUrl;

  factory BaseBroadcastEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseBroadcastEntityFromJson(json);

  BaseBroadcastEntity(this.bigImg, this.listUrl);
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
class BaseListEntity extends Object with _$BaseListEntitySerializerMixin {
  final int total;
  final List<ListEntity> list;

  factory BaseListEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseListEntityFromJson(json);

  BaseListEntity(this.total, this.list);
}

@JsonSerializable()
class ListEntity extends Object with _$ListEntitySerializerMixin {
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
  final String focusDate;
  @JsonKey(name: 'isaixiyou')
  final String isAiXiYou;

  factory ListEntity.fromJson(Map<String, dynamic> json) =>
      _$ListEntityFromJson(json);

  ListEntity(
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
