// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broad_cast_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBroadcastEntity _$BaseBroadcastEntityFromJson(Map<String, dynamic> json) =>
    new BaseBroadcastEntity(
        (json['bigImg'] as List)
            ?.map((e) => e == null
                ? null
                : new BroadcastBigImageEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
        json['listurl'] as String);

abstract class _$BaseBroadcastEntitySerializerMixin {
  List<BroadcastBigImageEntity> get bigImg;
  String get listUrl;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'bigImg': bigImg, 'listurl': listUrl};
}

BroadcastBigImageEntity _$BroadcastBigImageEntityFromJson(
        Map<String, dynamic> json) =>
    new BroadcastBigImageEntity(
        json['url'] as String,
        json['image'] as String,
        json['title'] as String,
        json['id'] as String,
        json['stype'] as String,
        json['type'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$BroadcastBigImageEntitySerializerMixin {
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

BroadcastListEntity _$BroadcastListEntityFromJson(Map<String, dynamic> json) =>
    new BroadcastListEntity(
        json['total'] as int,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new BroadcastChildListEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList());

abstract class _$BroadcastListEntitySerializerMixin {
  int get total;
  List<BroadcastChildListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'total': total, 'list': list};
}

BroadcastChildListEntity _$BroadcastChildListEntityFromJson(
        Map<String, dynamic> json) =>
    new BroadcastChildListEntity(
        json['num'] as int,
        json['datatype'] as String,
        json['id'] as String,
        json['title'] as String,
        json['videolength'] as String,
        json['guid'] as String,
        json['picurl'] as String,
        json['order'] as String,
        json['picurl2'] as String,
        json['picurl3'] as String,
        json['url'] as String,
        json['focus_date'] as int,
        json['isaixiyou'] as String);

abstract class _$BroadcastChildListEntitySerializerMixin {
  int get num;
  String get dataType;
  String get id;
  String get title;
  String get videoLength;
  String get guid;
  String get picUrl;
  String get order;
  String get picUrl2;
  String get picUrl3;
  String get url;
  int get focusDate;
  String get isAiXiYou;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'num': num,
        'datatype': dataType,
        'id': id,
        'title': title,
        'videolength': videoLength,
        'guid': guid,
        'picurl': picUrl,
        'order': order,
        'picurl2': picUrl2,
        'picurl3': picUrl3,
        'url': url,
        'focus_date': focusDate,
        'isaixiyou': isAiXiYou
      };
}
