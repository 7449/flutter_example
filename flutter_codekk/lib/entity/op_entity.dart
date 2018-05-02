import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'op_entity.g.dart';

@JsonSerializable()
class OpEntity extends Object with _$OpEntitySerializerMixin {
  final int code;
  final String message;
  final DataEntity data;

  OpEntity({@required this.data, @required this.code, @required this.message});

  factory OpEntity.fromJson(Map<String, dynamic> json) =>
      _$OpEntityFromJson(json);
}

@JsonSerializable()
class DataEntity extends Object with _$DataEntitySerializerMixin {
  final List<ProjectArrayEntity> projectArray;

  DataEntity({@required this.projectArray});

  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);
}

@JsonSerializable()
class ProjectArrayEntity extends Object
    with _$ProjectArrayEntitySerializerMixin {
  final String projectName;
  final String createTime;
  final String updateTime;
  final int expiredTimes;
  final int usedTimes;
  final int voteUp;
  final bool recommend;
  final bool hide;
  final String projectUrl;
  final String demoUrl;
  final String committer;
  final String source;
  final String lang;
  final String authorName;
  final String authorUrl;
  final String codeKKUrl;
  @JsonKey(name: '_id')
  final String id;
  final String desc;
  final Object officialUrl;
  final List<TagsEntity> tags;

  ProjectArrayEntity(
      {@required this.projectName,
      @required this.createTime,
      @required this.updateTime,
      @required this.expiredTimes,
      @required this.usedTimes,
      @required this.voteUp,
      @required this.recommend,
      @required this.hide,
      @required this.projectUrl,
      @required this.demoUrl,
      @required this.committer,
      @required this.source,
      @required this.lang,
      @required this.authorName,
      @required this.authorUrl,
      @required this.codeKKUrl,
      @required this.id,
      @required this.desc,
      @required this.officialUrl,
      @required this.tags});

  factory ProjectArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectArrayEntityFromJson(json);
}

@JsonSerializable()
class TagsEntity extends Object with _$TagsEntitySerializerMixin {
  final String createTime;
  final String name;
  final String userName;
  final String type;

  TagsEntity(
      {@required this.createTime,
      @required this.name,
      @required this.userName,
      @required this.type});

  factory TagsEntity.fromJson(Map<String, dynamic> json) =>
      _$TagsEntityFromJson(json);
}
