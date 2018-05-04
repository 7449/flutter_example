import 'package:json_annotation/json_annotation.dart';

part 'readme_entity.g.dart';

@JsonSerializable()
class ReadmeEntity extends Object with _$ReadmeEntitySerializerMixin {
  final DataEntity data;
  final int code;
  final String message;

  factory ReadmeEntity.fromJson(Map<String, dynamic> json) =>
      _$ReadmeEntityFromJson(json);

  ReadmeEntity(this.data, this.code, this.message);
}

@JsonSerializable()
class DataEntity extends Object with _$DataEntitySerializerMixin {
  @JsonKey(name: '_id')
  final String id;
  final String summaryId;
  final String content;
  final String title;
  final bool isFavorite;

  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);

  DataEntity(
      this.id, this.summaryId, this.content, this.title, this.isFavorite);
}
