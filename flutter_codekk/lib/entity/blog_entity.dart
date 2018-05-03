import 'package:json_annotation/json_annotation.dart';

part 'blog_entity.g.dart';

@JsonSerializable()
class BlogEntity extends Object with _$BlogEntitySerializerMixin {
  final DataEntity data;
  final int code;
  final String message;

  factory BlogEntity.fromJson(Map<String, dynamic> json) =>
      _$BlogEntityFromJson(json);

  BlogEntity(this.data, this.code, this.message);
}

@JsonSerializable()
class DataEntity extends Object with _$DataEntitySerializerMixin {
  final List<SummaryArrayEntity> summaryArray;

  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);

  DataEntity(this.summaryArray);
}

@JsonSerializable()
class SummaryArrayEntity extends Object
    with _$SummaryArrayEntitySerializerMixin {
  @JsonKey(name: '_id')
  final String id;
  final int status;
  final String path;
  final String title;
  final String summary;
  final String authorUrl;
  final String authorName;
  final String type;
  final String tags;
  final String createTime;
  final String updateTime;
  final String codeKKUrl;
  final String fullTitle;
  final List<String> tagList;

  factory SummaryArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$SummaryArrayEntityFromJson(json);

  SummaryArrayEntity(
      this.id,
      this.status,
      this.path,
      this.title,
      this.summary,
      this.authorUrl,
      this.authorName,
      this.type,
      this.tags,
      this.createTime,
      this.updateTime,
      this.codeKKUrl,
      this.fullTitle,
      this.tagList);
}
