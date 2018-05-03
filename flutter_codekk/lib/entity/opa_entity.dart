import 'package:json_annotation/json_annotation.dart';

part 'opa_entity.g.dart';

@JsonSerializable()
class OpaEntity extends Object with _$OpaEntitySerializerMixin {
  final DataEntity data;
  final int code;
  final String message;

  factory OpaEntity.fromJson(Map<String, dynamic> json) =>
      _$OpaEntityFromJson(json);

  OpaEntity(this.data, this.code, this.message);
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
