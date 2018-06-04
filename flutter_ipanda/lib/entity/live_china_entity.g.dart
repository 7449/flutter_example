// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_china_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

BaseLiveChinaEntity _$BaseLiveChinaEntityFromJson(Map<String, dynamic> json) =>
    new BaseLiveChinaEntity(
        (json['tablist'] as List)
            ?.map((e) => e == null
                ? null
                : new LiveChinaTabListEntity.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
        (json['alllist'] as List)
            ?.map((e) => e == null
                ? null
                : new LiveChinaAllEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$BaseLiveChinaEntitySerializerMixin {
  List<LiveChinaTabListEntity> get tabList;
  List<LiveChinaAllEntity> get allList;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'tablist': tabList, 'alllist': allList};
}

LiveChinaTabListEntity _$LiveChinaTabListEntityFromJson(
        Map<String, dynamic> json) =>
    new LiveChinaTabListEntity(json['title'] as String, json['url'] as String,
        json['id'] as String, json['order'] as String);

abstract class _$LiveChinaTabListEntitySerializerMixin {
  String get title;
  String get url;
  String get id;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'id': id, 'order': order};
}

LiveChinaAllEntity _$LiveChinaAllEntityFromJson(Map<String, dynamic> json) =>
    new LiveChinaAllEntity(json['title'] as String, json['url'] as String,
        json['id'] as String, json['order'] as String);

abstract class _$LiveChinaAllEntitySerializerMixin {
  String get title;
  String get url;
  String get id;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'id': id, 'order': order};
}
