// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

JobEntity _$JobEntityFromJson(Map<String, dynamic> json) =>
    new JobEntity((json['summaryArray'] as List)
        ?.map((e) => e == null
            ? null
            : new SummaryArrayEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$JobEntitySerializerMixin {
  List<SummaryArrayEntity> get summaryArray;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'summaryArray': summaryArray};
}

SummaryArrayEntity _$SummaryArrayEntityFromJson(Map<String, dynamic> json) =>
    new SummaryArrayEntity(
        json['_id'] as String,
        json['status'] as int,
        json['codeLang'] as String,
        json['source'] as String,
        json['title'] as String,
        json['summary'] as String,
        json['authorUrl'] as String,
        json['authorName'] as String,
        json['authorCity'] as String,
        json['type'] as String,
        json['createTime'] as String,
        json['expiredTime'] as String,
        json['codeKKUrl'] as String,
        json['fullTitle'] as String);

abstract class _$SummaryArrayEntitySerializerMixin {
  String get id;
  int get status;
  String get codeLang;
  String get source;
  String get title;
  String get summary;
  String get authorUrl;
  String get authorName;
  String get authorCity;
  String get type;
  String get createTime;
  String get expiredTime;
  String get codeKKUrl;
  String get fullTitle;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'status': status,
        'codeLang': codeLang,
        'source': source,
        'title': title,
        'summary': summary,
        'authorUrl': authorUrl,
        'authorName': authorName,
        'authorCity': authorCity,
        'type': type,
        'createTime': createTime,
        'expiredTime': expiredTime,
        'codeKKUrl': codeKKUrl,
        'fullTitle': fullTitle
      };
}
