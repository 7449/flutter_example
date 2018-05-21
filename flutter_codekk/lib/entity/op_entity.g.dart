// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'op_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

OpEntity _$OpEntityFromJson(Map<String, dynamic> json) => new OpEntity(
    json['data'] == null
        ? null
        : new DataEntity.fromJson(json['data'] as Map<String, dynamic>),
    json['code'] as int,
    json['message'] as String);

abstract class _$OpEntitySerializerMixin {
  DataEntity get data;
  int get code;
  String get message;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'data': data, 'code': code, 'message': message};
}

DataEntity _$DataEntityFromJson(Map<String, dynamic> json) =>
    new DataEntity((json['projectArray'] as List)
        ?.map((e) => e == null
            ? null
            : new ProjectArrayEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$DataEntitySerializerMixin {
  List<ProjectArrayEntity> get projectArray;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'projectArray': projectArray};
}

ProjectArrayEntity _$ProjectArrayEntityFromJson(Map<String, dynamic> json) =>
    new ProjectArrayEntity(
        json['projectName'] as String,
        json['createTime'] as String,
        json['updateTime'] as String,
        json['expiredTimes'] as int,
        json['usedTimes'] as int,
        json['voteUp'] as int,
        json['recommend'] as bool,
        json['hide'] as bool,
        json['projectUrl'] as String,
        json['demoUrl'] as String,
        json['committer'] as String,
        json['source'] as String,
        json['lang'] as String,
        json['authorName'] as String,
        json['authorUrl'] as String,
        json['codeKKUrl'] as String,
        json['_id'] as String,
        json['desc'] as String,
        json['officialUrl'],
        (json['tags'] as List)
            ?.map((e) => e == null
                ? null
                : new TagsEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$ProjectArrayEntitySerializerMixin {
  String get projectName;
  String get createTime;
  String get updateTime;
  int get expiredTimes;
  int get usedTimes;
  int get voteUp;
  bool get recommend;
  bool get hide;
  String get projectUrl;
  String get demoUrl;
  String get committer;
  String get source;
  String get lang;
  String get authorName;
  String get authorUrl;
  String get codeKKUrl;
  String get id;
  String get desc;
  Object get officialUrl;
  List<TagsEntity> get tags;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'projectName': projectName,
        'createTime': createTime,
        'updateTime': updateTime,
        'expiredTimes': expiredTimes,
        'usedTimes': usedTimes,
        'voteUp': voteUp,
        'recommend': recommend,
        'hide': hide,
        'projectUrl': projectUrl,
        'demoUrl': demoUrl,
        'committer': committer,
        'source': source,
        'lang': lang,
        'authorName': authorName,
        'authorUrl': authorUrl,
        'codeKKUrl': codeKKUrl,
        '_id': id,
        'desc': desc,
        'officialUrl': officialUrl,
        'tags': tags
      };
}

TagsEntity _$TagsEntityFromJson(Map<String, dynamic> json) => new TagsEntity(
    json['createTime'] as String,
    json['name'] as String,
    json['userName'] as String,
    json['type'] as String);

abstract class _$TagsEntitySerializerMixin {
  String get createTime;
  String get name;
  String get userName;
  String get type;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'createTime': createTime,
        'name': name,
        'userName': userName,
        'type': type
      };
}
