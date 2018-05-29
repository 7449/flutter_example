// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

BlogEntity _$BlogEntityFromJson(Map<String, dynamic> json) =>
    new BlogEntity((json['summaryArray'] as List)
        ?.map((e) => e == null
            ? null
            : new SummaryArrayEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$BlogEntitySerializerMixin {
  List<SummaryArrayEntity> get summaryArray;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'summaryArray': summaryArray};
}

SummaryArrayEntity _$SummaryArrayEntityFromJson(Map<String, dynamic> json) =>
    new SummaryArrayEntity(
        json['_id'] as String,
        json['status'] as int,
        json['path'] as String,
        json['title'] as String,
        json['summary'] as String,
        json['authorUrl'] as String,
        json['authorName'] as String,
        json['type'] as String,
        json['tags'] as String,
        json['createTime'] as String,
        json['updateTime'] as String,
        json['codeKKUrl'] as String,
        json['fullTitle'] as String,
        (json['tagList'] as List)?.map((e) => e as String)?.toList());

abstract class _$SummaryArrayEntitySerializerMixin {
  String get id;
  int get status;
  String get path;
  String get title;
  String get summary;
  String get authorUrl;
  String get authorName;
  String get type;
  String get tags;
  String get createTime;
  String get updateTime;
  String get codeKKUrl;
  String get fullTitle;
  List<String> get tagList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'status': status,
        'path': path,
        'title': title,
        'summary': summary,
        'authorUrl': authorUrl,
        'authorName': authorName,
        'type': type,
        'tags': tags,
        'createTime': createTime,
        'updateTime': updateTime,
        'codeKKUrl': codeKKUrl,
        'fullTitle': fullTitle,
        'tagList': tagList
      };
}
