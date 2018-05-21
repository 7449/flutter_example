// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'op_search_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

OpSearchEntity _$OpSearchEntityFromJson(Map<String, dynamic> json) =>
    new OpSearchEntity(
        json['data'] == null
            ? null
            : new DataEntity.fromJson(json['data'] as Map<String, dynamic>),
        json['code'] as int,
        json['message'] as String);

abstract class _$OpSearchEntitySerializerMixin {
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
        lang: json['lang'] as String,
        committer: json['committer'] as String,
        updateTime: json['updateTime'] as String,
        hide: json['hide'] as bool,
        authorUrl: json['authorUrl'] as String,
        projectName: json['projectName'] as String,
        expiredTimes: json['expiredTimes'] as int,
        authorName: json['authorName'] as String,
        usedTimes: json['usedTimes'] as int,
        source: json['source'] as String,
        projectUrl: json['projectUrl'] as String,
        officialUrl: json['officialUrl'],
        recommend: json['recommend'] as bool,
        desc: json['desc'] as String,
        createTime: json['createTime'] as String,
        voteUp: json['voteUp'] as int,
        codeKKUrl: json['codeKKUrl'] as String,
        id: json['_id'] as String,
        tags: (json['tags'] as List)
            ?.map((e) => e == null
                ? null
                : new TagsEntity.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$ProjectArrayEntitySerializerMixin {
  String get lang;
  String get committer;
  String get updateTime;
  bool get hide;
  String get authorUrl;
  String get projectName;
  int get expiredTimes;
  String get authorName;
  int get usedTimes;
  String get source;
  String get projectUrl;
  Object get officialUrl;
  bool get recommend;
  String get desc;
  String get createTime;
  int get voteUp;
  String get codeKKUrl;
  String get id;
  List<TagsEntity> get tags;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'lang': lang,
        'committer': committer,
        'updateTime': updateTime,
        'hide': hide,
        'authorUrl': authorUrl,
        'projectName': projectName,
        'expiredTimes': expiredTimes,
        'authorName': authorName,
        'usedTimes': usedTimes,
        'source': source,
        'projectUrl': projectUrl,
        'officialUrl': officialUrl,
        'recommend': recommend,
        'desc': desc,
        'createTime': createTime,
        'voteUp': voteUp,
        'codeKKUrl': codeKKUrl,
        '_id': id,
        'tags': tags
      };
}

TagsEntity _$TagsEntityFromJson(Map<String, dynamic> json) => new TagsEntity(
    json['userName'] as String,
    json['contentId'] as String,
    json['type'] as String,
    json['createTime'] as String,
    json['name'] as String);

abstract class _$TagsEntitySerializerMixin {
  String get userName;
  String get contentId;
  String get type;
  String get createTime;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'contentId': contentId,
        'type': type,
        'createTime': createTime,
        'name': name
      };
}
