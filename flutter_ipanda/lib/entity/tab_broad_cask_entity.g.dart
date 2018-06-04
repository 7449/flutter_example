// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_broad_cask_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

BaseBroadcastEntity _$BaseBroadcastEntityFromJson(Map<String, dynamic> json) =>
    new BaseBroadcastEntity(
        (json['bigImg'] as List)
            ?.map((e) => e == null
                ? null
                : new BigImageEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['listurl'] as String);

abstract class _$BaseBroadcastEntitySerializerMixin {
  List<BigImageEntity> get bigImg;
  String get listUrl;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'bigImg': bigImg, 'listurl': listUrl};
}

BigImageEntity _$BigImageEntityFromJson(Map<String, dynamic> json) =>
    new BigImageEntity(
        json['url'] as String,
        json['image'] as String,
        json['title'] as String,
        json['id'] as String,
        json['stype'] as String,
        json['type'] as String,
        json['pid'] as String,
        json['vid'] as String,
        json['order'] as String);

abstract class _$BigImageEntitySerializerMixin {
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

BaseListEntity _$BaseListEntityFromJson(Map<String, dynamic> json) =>
    new BaseListEntity(
        json['total'] as int,
        (json['list'] as List)
            ?.map((e) => e == null
                ? null
                : new ListEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$BaseListEntitySerializerMixin {
  int get total;
  List<ListEntity> get list;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'total': total, 'list': list};
}

ListEntity _$ListEntityFromJson(Map<String, dynamic> json) => new ListEntity(
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
    json['focus_date'] as String,
    json['isaixiyou'] as String);

abstract class _$ListEntitySerializerMixin {
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
  String get focusDate;
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
