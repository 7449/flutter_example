// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readme_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ReadmeEntity _$ReadmeEntityFromJson(Map<String, dynamic> json) =>
    new ReadmeEntity(
        json['data'] == null
            ? null
            : new DataEntity.fromJson(json['data'] as Map<String, dynamic>),
        json['code'] as int,
        json['message'] as String);

abstract class _$ReadmeEntitySerializerMixin {
  DataEntity get data;
  int get code;
  String get message;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'data': data, 'code': code, 'message': message};
}

DataEntity _$DataEntityFromJson(Map<String, dynamic> json) => new DataEntity(
    json['_id'] as String,
    json['summaryId'] as String,
    json['content'] as String,
    json['title'] as String,
    json['isFavorite'] as bool);

abstract class _$DataEntitySerializerMixin {
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
