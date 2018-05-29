import 'package:json_annotation/json_annotation.dart';

part 'op_search_entity.g.dart';

@JsonSerializable()
class OpSearchEntity extends Object with _$OpSearchEntitySerializerMixin {
  final List<ProjectArrayEntity> projectArray;

  factory OpSearchEntity.fromJson(Map<String, dynamic> json) =>
      _$OpSearchEntityFromJson(json);

  OpSearchEntity(this.projectArray);
}

@JsonSerializable()
class ProjectArrayEntity extends Object
    with _$ProjectArrayEntitySerializerMixin {
  final String lang;
  final String committer;
  final String updateTime;
  final bool hide;
  final String authorUrl;
  final String projectName;
  final int expiredTimes;
  final String authorName;
  final int usedTimes;
  final String source;
  final String projectUrl;
  final Object officialUrl;
  final bool recommend;
  final String desc;
  final String createTime;
  final int voteUp;
  final String codeKKUrl;
  @JsonKey(name: '_id')
  final String id;
  final List<TagsEntity> tags;

  factory ProjectArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectArrayEntityFromJson(json);

  ProjectArrayEntity(
      {this.lang,
      this.committer,
      this.updateTime,
      this.hide,
      this.authorUrl,
      this.projectName,
      this.expiredTimes,
      this.authorName,
      this.usedTimes,
      this.source,
      this.projectUrl,
      this.officialUrl,
      this.recommend,
      this.desc,
      this.createTime,
      this.voteUp,
      this.codeKKUrl,
      this.id,
      this.tags});
}

@JsonSerializable()
class TagsEntity extends Object with _$TagsEntitySerializerMixin {
  final String userName;
  final String contentId;
  final String type;
  final String createTime;
  final String name;

  factory TagsEntity.fromJson(Map<String, dynamic> json) =>
      _$TagsEntityFromJson(json);

  TagsEntity(
      this.userName, this.contentId, this.type, this.createTime, this.name);
}
