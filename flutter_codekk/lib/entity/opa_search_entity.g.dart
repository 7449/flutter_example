// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opa_search_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

OpaSearchEntity _$OpaSearchEntityFromJson(Map<String, dynamic> json) =>
    new OpaSearchEntity(
        json['data'] == null
            ? null
            : new DataEntity.fromJson(json['data'] as Map<String, dynamic>),
        json['code'] as int,
        json['message'] as String);

abstract class _$OpaSearchEntitySerializerMixin {
  DataEntity get data;
  int get code;
  String get message;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'data': data, 'code': code, 'message': message};
}

DataEntity _$DataEntityFromJson(Map<String, dynamic> json) =>
    new DataEntity((json['summaryArray'] as List)
        ?.map((e) => e == null
            ? null
            : new SummaryArrayEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$DataEntitySerializerMixin {
  List<SummaryArrayEntity> get summaryArray;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'summaryArray': summaryArray};
}

SummaryArrayEntity _$SummaryArrayEntityFromJson(Map<String, dynamic> json) =>
    new SummaryArrayEntity(
        json['_id'] as String,
        json['status'] as int,
        json['path'] as String,
        json['type'] as String,
        json['summary'] as String,
        json['phase'] as String,
        json['tags'] as String,
        json['createTime'] as String,
        json['updateTime'] as String,
        json['codeLang'] as String,
        json['source'] as String,
        json['title'] as String,
        json['projectUrl'] as String,
        json['projectName'] as String,
        json['demoUrl'] as String,
        json['authorUrl'] as String,
        json['authorName'] as String,
        json['codeKKUrl'] as String,
        json['fullTitle'] as String,
        (json['tagList'] as List)?.map((e) => e as String)?.toList());

abstract class _$SummaryArrayEntitySerializerMixin {
  String get id;
  int get status;
  String get path;
  String get type;
  String get summary;
  String get phase;
  String get tags;
  String get createTime;
  String get updateTime;
  String get codeLang;
  String get source;
  String get title;
  String get projectUrl;
  String get projectName;
  String get demoUrl;
  String get authorUrl;
  String get authorName;
  String get codeKKUrl;
  String get fullTitle;
  List<String> get tagList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'status': status,
        'path': path,
        'type': type,
        'summary': summary,
        'phase': phase,
        'tags': tags,
        'createTime': createTime,
        'updateTime': updateTime,
        'codeLang': codeLang,
        'source': source,
        'title': title,
        'projectUrl': projectUrl,
        'projectName': projectName,
        'demoUrl': demoUrl,
        'authorUrl': authorUrl,
        'authorName': authorName,
        'codeKKUrl': codeKKUrl,
        'fullTitle': fullTitle,
        'tagList': tagList
      };
}
