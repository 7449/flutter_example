import 'package:json_annotation/json_annotation.dart';

part 'job_entity.g.dart';

@JsonSerializable()
class JobEntity extends Object with _$JobEntitySerializerMixin {
  final List<SummaryArrayEntity> summaryArray;

  factory JobEntity.fromJson(Map<String, dynamic> json) =>
      _$JobEntityFromJson(json);

  JobEntity(this.summaryArray);
}

@JsonSerializable()
class SummaryArrayEntity extends Object
    with _$SummaryArrayEntitySerializerMixin {
  @JsonKey(name: '_id')
  final String id;
  final int status;
  final String codeLang;
  final String source;
  final String title;
  final String summary;
  final String authorUrl;
  final String authorName;
  final String authorCity;
  final String type;
  final String createTime;
  final String expiredTime;
  final String codeKKUrl;
  final String fullTitle;

  factory SummaryArrayEntity.fromJson(Map<String, dynamic> json) =>
      _$SummaryArrayEntityFromJson(json);

  SummaryArrayEntity(
      this.id,
      this.status,
      this.codeLang,
      this.source,
      this.title,
      this.summary,
      this.authorUrl,
      this.authorName,
      this.authorCity,
      this.type,
      this.createTime,
      this.expiredTime,
      this.codeKKUrl,
      this.fullTitle);
}
