import 'package:json_annotation/json_annotation.dart';

part 'opa_search_entity.g.dart';

@JsonSerializable()
class OpaSearchEntity extends Object with _$OpaSearchEntitySerializerMixin {
  final List<SummaryArrayEntity> summaryArray;

  factory OpaSearchEntity.fromJson(Map<String, dynamic> json) =>
      _$OpaSearchEntityFromJson(json);

  OpaSearchEntity(this.summaryArray);
}

@JsonSerializable()
class SummaryArrayEntity extends Object
    with _$SummaryArrayEntitySerializerMixin {
  @JsonKey(name: '_id')
  final String id;
  final int status;
  final String path;
  final String type;
  final String summary;
  final String phase;
  final String tags;
  final String createTime;
  final String updateTime;
  final String codeLang;
  final String source;
  final String title;
  final String projectUrl;
  final String projectName;
  final String demoUrl;
  final String authorUrl;
  final String authorName;
  final String codeKKUrl;
  final String fullTitle;
  final List<String> tagList;

  factory SummaryArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$SummaryArrayEntityFromJson(json);

  SummaryArrayEntity(
      this.id,
      this.status,
      this.path,
      this.type,
      this.summary,
      this.phase,
      this.tags,
      this.createTime,
      this.updateTime,
      this.codeLang,
      this.source,
      this.title,
      this.projectUrl,
      this.projectName,
      this.demoUrl,
      this.authorUrl,
      this.authorName,
      this.codeKKUrl,
      this.fullTitle,
      this.tagList);
}
