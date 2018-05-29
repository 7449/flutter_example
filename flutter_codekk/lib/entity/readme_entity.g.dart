// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readme_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ReadmeEntity _$ReadmeEntityFromJson(Map<String, dynamic> json) =>
    new ReadmeEntity(
        json['_id'] as String,
        json['summaryId'] as String,
        json['content'] as String,
        json['title'] as String,
        json['isFavorite'] as bool);

abstract class _$ReadmeEntitySerializerMixin {
  String get id;
  String get summaryId;
  String get content;
  String get title;
  bool get isFavorite;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'summaryId': summaryId,
        'content': content,
        'title': title,
        'isFavorite': isFavorite
      };
}
