// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_panda_live_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TabLiveEntity _$TabLiveEntityFromJson(Map<String, dynamic> json) =>
    new TabLiveEntity((json['tablist'] as List)
        ?.map((e) => e == null
            ? null
            : new LiveTabListEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$TabLiveEntitySerializerMixin {
  List<LiveTabListEntity> get tabList;
  Map<String, dynamic> toJson() => <String, dynamic>{'tablist': tabList};
}

LiveTabListEntity _$LiveTabListEntityFromJson(Map<String, dynamic> json) =>
    new LiveTabListEntity(json['title'] as String, json['url'] as String,
        json['id'] as String, json['order'] as String);

abstract class _$LiveTabListEntitySerializerMixin {
  String get title;
  String get url;
  String get id;
  String get order;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': title, 'url': url, 'id': id, 'order': order};
}
