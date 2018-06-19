// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabEntity _$TabEntityFromJson(Map<String, dynamic> json) =>
    new TabEntity((json['tab'] as List)
        ?.map((e) => e == null
            ? null
            : new TabListEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$TabEntitySerializerMixin {
  List<TabListEntity> get tab;
  Map<String, dynamic> toJson() => <String, dynamic>{'tab': tab};
}

TabListEntity _$TabListEntityFromJson(Map<String, dynamic> json) =>
    new TabListEntity(json['title'] as String, json['noimage'] as String,
        json['image'] as String, json['url'] as String);

abstract class _$TabListEntitySerializerMixin {
  String get title;
  String get noImage;
  String get image;
  String get url;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'noimage': noImage,
        'image': image,
        'url': url
      };
}
