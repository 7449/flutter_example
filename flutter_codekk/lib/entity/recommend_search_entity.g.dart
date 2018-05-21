// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_search_entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

RecommendSearchEntity _$RecommendSearchEntityFromJson(
        Map<String, dynamic> json) =>
    new RecommendSearchEntity(
        json['data'] == null
            ? null
            : new DataEntity.fromJson(json['data'] as Map<String, dynamic>),
        json['code'] as int,
        json['message'] as String);

abstract class _$RecommendSearchEntitySerializerMixin {
  DataEntity get data;
  int get code;
  String get message;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'data': data, 'code': code, 'message': message};
}

DataEntity _$DataEntityFromJson(Map<String, dynamic> json) =>
    new DataEntity((json['recommendArray'] as List)
        ?.map((e) => e == null
            ? null
            : new RecommendArrayEntity.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$DataEntitySerializerMixin {
  List<RecommendArrayEntity> get recommendArray;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'recommendArray': recommendArray};
}

RecommendArrayEntity _$RecommendArrayEntityFromJson(
        Map<String, dynamic> json) =>
    new RecommendArrayEntity(
        json['_id'] as String,
        json['toCodeKKWx'] as bool,
        json['isDelete'] as bool,
        json['createTime'] as String,
        json['url'] as String,
        json['title'] as String,
        json['desc'] as String,
        json['type'] as String,
        json['userName'] as String,
        json['codeKKUrl'] as String,
        json['isFavorite'] as bool,
        json['encodeUrl'] as String,
        (json['articleTags'] as List)
            ?.map((e) => e == null
                ? null
                : new ArticleTagsEntity.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['contentTypes'] as List)?.map((e) => e as String)?.toList());

abstract class _$RecommendArrayEntitySerializerMixin {
  String get id;
  bool get toCodeKKWx;
  bool get isDelete;
  String get createTime;
  String get url;
  String get title;
  String get desc;
  String get type;
  String get userName;
  String get codeKKUrl;
  bool get isFavorite;
  String get encodeUrl;
  List<ArticleTagsEntity> get articleTags;
  List<String> get contentTypes;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'toCodeKKWx': toCodeKKWx,
        'isDelete': isDelete,
        'createTime': createTime,
        'url': url,
        'title': title,
        'desc': desc,
        'type': type,
        'userName': userName,
        'codeKKUrl': codeKKUrl,
        'isFavorite': isFavorite,
        'encodeUrl': encodeUrl,
        'articleTags': articleTags,
        'contentTypes': contentTypes
      };
}

ArticleTagsEntity _$ArticleTagsEntityFromJson(Map<String, dynamic> json) =>
    new ArticleTagsEntity(json['createTime'] as String, json['name'] as String,
        json['userName'] as String, json['type'] as String);

abstract class _$ArticleTagsEntitySerializerMixin {
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
