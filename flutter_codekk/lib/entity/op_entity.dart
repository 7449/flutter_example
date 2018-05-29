import 'package:json_annotation/json_annotation.dart';

part 'op_entity.g.dart';

@JsonSerializable()
class OpEntity extends Object with _$OpEntitySerializerMixin {
  final List<ProjectArrayEntity> projectArray;

  factory OpEntity.fromJson(Map<String, dynamic> json) =>
      _$OpEntityFromJson(json);

  OpEntity(this.projectArray);
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

  factory ProjectArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectArrayEntityFromJson(json);

  ProjectArrayEntity(
      this.projectName,
      this.createTime,
      this.updateTime,
      this.expiredTimes,
      this.usedTimes,
      this.voteUp,
      this.recommend,
      this.hide,
      this.projectUrl,
      this.demoUrl,
      this.committer,
      this.source,
      this.lang,
      this.authorName,
      this.authorUrl,
      this.codeKKUrl,
      this.id,
      this.desc,
      this.officialUrl,
      this.tags);
}

@JsonSerializable()
class TagsEntity extends Object with _$TagsEntitySerializerMixin {
  final String createTime;
  final String name;
  final String userName;
  final String type;

  factory TagsEntity.fromJson(Map<String, dynamic> json) =>
      _$TagsEntityFromJson(json);

  TagsEntity(this.createTime, this.name, this.userName, this.type);
}
